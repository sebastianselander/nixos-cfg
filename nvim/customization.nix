let
    remap = builtins.readFile ./remap.lua;
    set = builtins.readFile ./set.lua;

    plugins = import ./plugins/config.nix;
in
    ''
    lua << EOF
    ${remap}
    ${set}
    ${plugins}
    EOF
    ''
