{ pkgs, ... }:
{

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
    clock24 = true;
    terminal = "screen-256color";
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;
    plugins = [
      pkgs.tmuxPlugins.resurrect
      pkgs.tmuxPlugins.sensible
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
