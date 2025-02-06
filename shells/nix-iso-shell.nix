{ pkgs }:

pkgs.mkShell {
  packages = (with pkgs.sputnix; [
    nix-iso-setup
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
