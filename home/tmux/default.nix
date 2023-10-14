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
    extraConfig =
      "
                set-option -g default-shell /run/current-system/sw/bin/zsh
                bind h select-pane -L
                bind j select-pane -D
                bind k select-pane -U
                bind l select-pane -R

                is_vim=\"ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\\\S+\\\\/)?g?\\.?(view|n?vim?x?)(-wrapped)?(diff)?$'\"

                bind-key -n 'M-h' if-shell \"$is_vim\" 'send-keys M-h' { if -F '#{pane_at_left}' '' 'select-pane -L' }
                bind-key -n 'M-j' if-shell \"$is_vim\" 'send-keys M-j' { if -F '#{pane_at_bottom}' '' 'select-pane -D' }
                bind-key -n 'M-k' if-shell \"$is_vim\" 'send-keys M-k' { if -F '#{pane_at_top}' '' 'select-pane -U' }
                bind-key -n 'M-l' if-shell \"$is_vim\" 'send-keys M-l' { if -F '#{pane_at_right}' '' 'select-pane -R' }

                bind-key -T copy-mode-vi 'M-h' if -F '#{pane_at_left}' '' 'select-pane -L'
                bind-key -T copy-mode-vi 'M-j' if -F '#{pane_at_bottom}' '' 'select-pane -D'
                bind-key -T copy-mode-vi 'M-k' if -F '#{pane_at_top}' '' 'select-pane -U'
                bind-key -T copy-mode-vi 'M-l' if -F '#{pane_at_right}' '' 'select-pane -R'

                bind -n 'M-a' if-shell \"$is_vim\" 'send-keys M-a' 'resize-pane -L 1'
                bind -n 'M-s' if-shell \"$is_vim\" 'send-keys M-s' 'resize-pane -D 1'
                bind -n 'M-w' if-shell \"$is_vim\" 'send-keys M-w' 'resize-pane -U 1'
                bind -n 'M-d' if-shell \"$is_vim\" 'send-keys M-d' 'resize-pane -R 1'

                bind-key -T copy-mode-vi M-a resize-pane -L 1
                bind-key -T copy-mode-vi M-s resize-pane -D 1
                bind-key -T copy-mode-vi M-w resize-pane -U 1
                bind-key -T copy-mode-vi M-d resize-pane -R 1

                # statusbar
                set -g status-position bottom
                set -g status-right ''
                setw -g window-status-current-style 'fg=colour1 bold'
                setw -g window-status-current-format '#[fg=#41a6b5]#I:#[fg=#41a6b5]#W'
                setw -g window-status-format '#I:#W'
                set-option -g pane-border-style fg=\"#FFFFFF\"
                set -g status-fg gray
                set -g status-bg \"#24283b\"

                bind c new-window -c \"#{pane_current_path}\"
                bind '\"' split-window -c \"#{pane_current_path}\"
                bind % split-window -h -c \"#{pane_current_path}\"
                bind C-n next-window
                bind C-p previous-window
                bind a last-window

                set -g @resurrect-strategy-nvim 'session'
                ";
  };
}
