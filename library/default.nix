{ lib }: {
  namesOfDirsIn = import ./namesOfDirsIn.nix { inherit lib; };
  attrsFromList = import ./attrsFromList.nix { inherit lib; };
  enabling      = import ./enabling.nix;
}
