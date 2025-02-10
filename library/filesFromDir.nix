{ lib }:

let
  inherit (builtins) attrNames readDir;
in
  (path:
    readDir path
    |> attrNames
  )
