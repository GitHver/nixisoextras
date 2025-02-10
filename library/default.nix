{ lib }: {
  namesOfDirsIn = import ./namesOfDirsIn.nix { inherit lib; };
  attrsFromList = import ./attrsFromList.nix { inherit lib; };
  attrsForEach  = import ./attrsForEach.nix  { inherit lib; };
  enabling      = import ./enabling.nix      { inherit lib; };
}
