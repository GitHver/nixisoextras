
    builtins.zipAttrsWith
    builtins.storePath
    builtins.splitVersion
    builtins.split
    builtins.seq
    builtins.readFile
    builtins.readDir
    builtins.placeholder
    builtins.pathExists
    builtins.path
    builtins.partition
    builtins.parseDrvName
    builtins.lessThan
    builtins.import
    builtins.hashString
    builtins.hashFile
    builtins.getFlake
    builtins.getEnv
    builtins.genericClosure
    builtins.functionArgs
    builtins.fromJSON
    builtins.filterSource
    builtins.filter
    builtins.elemAt
    builtins.elem
    builtins.dirOf
    builtins.deepSeq
    builtins.compareVersions
    builtins.baseNameOf

# Nix Builtin functions

### Tests
    builtins.tryEval
    builtins.throw
    builtins.abort
    builtins.trace

### Math
    builtins.add
    builtins.sub
    builtins.mul
    builtins.div

### Float functions
    builtins.ceil
    builtins.floor

### List functions
    builtins.map
    builtins.head
    builtins.tail
    builtins.genList
    builtins.concatMap
    builtins.concatLists
    builtins.listToAttrs
    builtins.sort
    builtins.any
    builtins.all
    builtins.groupBy
    builtins.foldl’

### Attrset functions
    builtins.mapAttrs
    builtins.removeAttrs
    builtins.catAttrs
    builtins.getAttr
    builtins.hasAttr
    builtins.intersectAttrs
    builtins.attrValues
    builtins.attrNames

### String Functions
    builtins.replaceStrings
    builtins.substring
    builtins.stringLength
    builtins.match
    builtins.concatStringsSep
    builtins.length

### Bitwise functions
    builtins.bitXor
    builtins.bitOr
    builtins.bitAnd

### Test type functions
    builtins.typeOf
    builtins.isString
    builtins.isPath
    builtins.isNull
    builtins.isList
    builtins.isInt
    builtins.isFunction
    builtins.isFloat
    builtins.isBool
    builtins.isAttrs

### Fetch fnuctions
    builtins.fetchurl
    builtins.fetchTarball
    builtins.fetchGit
    builtins.fetchClosure

### To format functions  
    builtins.toXML
    builtins.toString
    builtins.toPath
    builtins.toJSON
    builtins.toFile
