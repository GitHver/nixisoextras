{ lib }:

let
  inherit (lib.lists) forEach;
  attrsFromList = import ./attrsFromList.nix { inherit lib; };
  # attrsForEach = list: func: attrsFromList (forEach list func);
in
  (list: func: attrsFromList (forEach list func))
