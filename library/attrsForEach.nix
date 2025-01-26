{ lib }:

let
  inherit (lib.lists) foldl;
  inherit (lib.lists) forEach;
  # attrsFromList = (list: foldl (a: b: a // b) { } list);
  attrsFromList = import ./attrsFromList.nix { inherit lib; };
  attrsForEach = list: func: attrsFromList list func;
in attrsForEach
