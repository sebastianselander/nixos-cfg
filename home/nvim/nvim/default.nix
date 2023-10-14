let
  remap = builtins.readFile ./remap.lua;
  set = builtins.readFile ./set.lua;

  plugins = import ./plugins/config.nix;
in
# Load plugins last for specific plugin overrides
''
  lua << EOF
  ${remap}
  ${set}
  ${plugins}
  EOF
''
