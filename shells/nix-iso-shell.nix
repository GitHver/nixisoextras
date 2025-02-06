{ pkgs }:

pkgs.mkShell {
  packages = (with pkgs; [
    # nix-iso-setup
    (import ./../programs/nix-iso-setup { inherit pkgs; })
  ]);
  shellHook = /*bash*/''
    echo '
        welcome to the early iteration of the Inix installer
        as of 6/2/25, this project is barely functional.
        Good luck!!
    '
    exec nix-iso-setup
  '';
}
