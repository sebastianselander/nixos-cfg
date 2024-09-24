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
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      sensible
      yank
      continuum
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
