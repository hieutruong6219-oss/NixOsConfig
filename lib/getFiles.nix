{ directoryName }:
builtins.listToAttrs (
  map (file: {
    name = file;
    value = ./${directoryName} + "/${file}";
  }) (builtins.attrNames (builtins.readDir ./${directoryName}))
)
