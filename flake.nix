{ ############################ Initial scope ###################################

  # Replace this with a description of what your flake does
  description = ''
    # The SputNix flake!

    The Purpose this flake is to be a starting template for beginners to use
    in order to get familiar with the Nix ecosystem. It is not a complete
    framework for using your system like a distribution, but is designed in
    a way for you to be easily able to modify by taking a fairly unopinionated
    stance on structuring.
  '';

  inputs = {
    #====<< Core Nixpkgs >>====================================================>
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  #====<< Outputs Field >>=====================================================>
  outputs = inputs @ { self, nixpkgs, ... }: let
    #====<< Required arguments >>======>
    # Binds the outputs attribute set to a variable
    inherit (self) outputs;
    lib = nixpkgs.lib // outputs.lib;
    #====<< Used functions >>==========>
    inherit (builtins) attrNames readDir;
    inherit (lib) genAttrs attrsFromList removeSuffix;
    # inherit (lib.lists) forEach;
    inherit (lib.filesystem) listFilesRecursive;
    getBaseFileNames = dir: removeNixSuffix (attrNames (readDir dir));
    attrsForEach = import ./library/attrsForEach.nix { inherit lib; };
    removeNixSuffix = import ./library/removeNixSuffix.nix { inherit lib; };
    #====<< Host information >>========>
    genEachArch = (funct: genAttrs supportedArchs funct);
    supportedArchs = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  in {

    #====<< Nix Code Formatter >>==============================================>
    # This defines the formatter that is used when you run `nix fmt`. Since this
    # calls the formatters package, you'll need to define which architecture
    # package is used so different computers can fetch the right package.
    formatter = genEachArch (system:
      let pkgs = import nixpkgs { inherit system; };
      in pkgs.nixpkgs-fmt
      or pkgs.nixfmt-rfc-style
      or pkgs.alejandra
    );

    #====<< Nix Expression Library >>==========================================>
    # When programming in any language, you will want to avoid writing
    # repetitive lines and definitions. Here you can define your own custom Nix
    # library accessable to others who reference your flake.
    lib = import ./library { inherit lib; };
    # lib = attrsForEach (getBaseFileNames ./library)
    #   (fn: { ${fn} = import ./library/${fn}.nix { inherit lib; }; });

    #====<< NixOS Modules >>===================================================>
    # This creates an attributeset where the default attribute is a list of
    # all paths to modules. This can then be referenced with the `self`
    # attribute to give you access to all your modules anwhere.
    nixosModules = {
      default = { imports = listFilesRecursive ./modules; };
    };

    #====<< Overlays >>========================================================>
    # Overlays are perhaps the most powerful feature Nix has. You can use them
    # to overlay overrides to existing packages in the with custom options. This
    # alloes you to apply your own patches or build flags with out needing to
    # maintain a fork of nixpkgs or adding a third party repository.
    overlays = {
      default = (final: prev: {
        sputnix = self.pkgs.${prev.system};
      });
    };

    #====<< Nix Development Shells >>==========================================>
    # Development shells `nix develop` are ephemeral environments where you can
    # get access to packages that are only available in the initialized shell
    # (like `nix shell`), but here you can go through execution stages manually
    # to better test and verify packages. Packages from dev shells are also
    # cached after initialization so that later calls are instant.
    devShells = genEachArch (system:
    let pkgs = import nixpkgs { inherit system; }; in
      attrsForEach (getBaseFileNames ./shells) (shell: {
        "${shell}" = import ./shells/${shell}.nix { inherit pkgs; };
      })
    );

    #====<< Packages >>========================================================>
    # Here is where you define your custom packages. You can package anything
    # you want, but should only keep personal packages in this repository as it
    # is better to keep papackages you want to be publicaly accessable in a
    # seperate repository and eventually added to the offical nixpkgs repo.
    pkgs = genEachArch (system:
    let pkgs = import nixpkgs { inherit system; }; in
      attrsForEach (getBaseFileNames ./packages) (package: {
        "${package}" = import ./packages/${package}.nix { inherit pkgs; };
      })
    );

    #====<< Applications >>====================================================>
    # Applications differ from packages by that they can be started with:
    # `nix run .#<name-of-application>`. As you can only "run" applications,
    # other packages like theme sets or program extensions like plugins cannot
    # be applications. Other than that they are identical.
    # apps = supportedSystems (system:
    #   import ./apps system
    # );

    #====<< Literally Anything >>==============================================>
    # The ouputs set can contain anything you want, the above are just things
    # mapped by the Nix command or just convention (which you should follow!),
    # but if you need some thing else, you can just create an attribute for it.
    anyName = "anything";

  };

} ################ End of Output and inital scope ##############################
