{ lib }:

let
  inherit (lib) removePrefix;
  # inherit (lib.lists) forEach;
  inherit (lib.filesystem) listFilesRecursive;
  attrsForEach = import ./attrsFromList.nix { inherit lib; };
  removePathPrefix = first: second: removePrefix (toString first) (toString second);

  # This function takes a string corrisponding to where in your home directory
  # you want the files to go, and a relative path to the directory to
  # recursively symlink the contents of. Example input:
  # path: /home/USER/parentDir/homeMangerRepo
  # to: ".config"
  # from: ./../assets/dot-config -> /nix/store/ae4...ae4/assets/dot-config
  # file: /nix/store/ae4...ae4/assets/dot-config/helix/config.toml
  # fileItSelf: /helix/config.toml
  # to/fileItSelf: (/home/USER/) ".config" + /helix/config.toml
  # source: /home/USER/parentRepo/homeMangerRepo + /assets/dot-config + /helix/config.toml
  mutSymlink = (self: func: path: to: from:
    attrsForEach (listFilesRecursive from) (file:
      let
        fileItSelf = removePathPrefix from file;
      in {
        "${to}/${fileItSelf}".source =
          func (path + (removePathPrefix self from) + fileItSelf)
        ;
      }
    )
  );
in mutSymlink
