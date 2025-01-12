{ pkgs }:

pkgs.writeShellApplication {
  name = "upgrade-bash";
  text = ./../programs/upgrade-bash;
}
