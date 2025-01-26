{ lib }:

let
  attrsFromList = import ./attrsFromList.nix { inherit lib; };
  inherit (lib) removePrefix;
  inherit (lib.lists) forEach;
  # inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (lib.filesystem) listFilesRecursive;
  # This function takes a string corrisponding to where in your home directory
  # you want the files to go, and a relative path to the directory to
  # recursively symlink the contents of.
  mutSymlink = (selfr: func: path: to: from: attrsFromList (
    forEach (listFilesRecursive from) (file:
      let fileItSelf = removePrefix (toString from) (toString file);
      # in { "${to}/${fileItSelf}".source = mkOutOfStoreSymlink ((flakePath from) + fileItSelf); }
      in {
        "${to}/${fileItSelf}".source =
          func (
            (path) + removePrefix (toString selfr) (toString from) + fileItSelf
          )
        ;
      }
    )
  ));
in mutSymlink
