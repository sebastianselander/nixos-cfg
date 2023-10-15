{ pkgs, ... }:
{

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    clock24 = true;
    terminal = "screen-256color";
    mouse = true;
    escapeTime = 0;
    plugins = [
      pkgs.tmuxPlugins.resurrect
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
