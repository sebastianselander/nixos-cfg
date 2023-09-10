{ pkgs, ... }:

{
    home = {
        username = "sebastian";
        homeDirectory = "/home/sebastian";
        stateVersion = "23.05";
        language.base = "en_US.UTF-8";
        packages = with pkgs; [
                (agda.withPackages [ agdaPackages.standard-library ])
                bat
                cabal-install
                discord
                dmenu
                exa
                feh
                firefox
                gcc
                gh
                ghc
                ghcid
                gnumake
                haskell-language-server
                hlint
                htop
                iosevka
                julia-mono
                libreoffice
                neofetch
                nerdfonts
                nil
                nixos-option
                obs-studio
                pandoc
                ripgrep
                spotify
                stack
                texlive.combined.scheme-full
                thunderbird
                tree
                vlc
                wget
                xclip
                zlib
                zoom-us
                ];

        file = {
            ".ghci".source = ../.ghci;
        };
    };

    nixpkgs.config.allowUnfree = true;

    fonts.fontconfig.enable = true;

    programs = {
        btop.enable = true;
        kitty = {
            enable = true;
            font = {
                name = "Iosevka";
                size = 16;
            };
            #theme = "Oceanic Material";
            extraConfig = builtins.readFile ../kitty/kitty-themes/themes/Kanagawa.conf;
            shellIntegration.enableZshIntegration = true;
            settings = {
                    enable_audio_bell = false;
                    disable_ligatures = true;
                    cursor_shape = "block";
                    cursor = "#00FF00";
                    background_opacity = 1;
                    window_padding_width = 2;
                };

        };
        git = {
            enable = true;
            userName  = "sebastianselander";
            userEmail = "sebastian.selander@gmail.com";
        };
        home-manager = {
            enable = true;
        };
        starship = {
            enable = true;
            settings = {
                add_newline = false;
                package.disabled = true;
                character = {
                    success_symbol = "[>](bold green)";
                    error_symbol = "[>](bold red)";
                };
            };
        };
        zathura = {
            enable = true;
            options = {
                recolor = true;
                step = 20;
                selection-clipboard = "clipboard";

            };
        };
        nushell = {
            configFile.source = ../nushell/config.nu;
            envFile.source = ../nushell/env.nu;
            loginFile.source = ../nushell/login.nu;
            shellAliases = {
                gs = "git status";
                gc = "git commit";
                gf = "git fetch";
                gp = "git push";
                ga = "git add";
                cfg = "cd ~/Documents/git/nixos-cfg/";
                ls  = "exa --group-directories-first";
                lsa = "exa --group-directories-first -la";
                lst = "exa -s modified -1";
                vim = "nvim";
                con = "mullvad connect";
                disc = "mullvad disconnect";
                rebuild = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg/";
            };

        };
        zsh = {
            enable = true;
            enableCompletion = true;
            enableAutosuggestions = true;
            syntaxHighlighting.enable = true;
            shellAliases = {
                gs = "git status";
                gc = "git commit";
                gf = "git fetch";
                gp = "git push";
                ga = "git add";
                cfg = "cd ~/Documents/git/nixos-cfg/";
                ls  = "exa --group-directories-first";
                lsa = "exa --group-directories-first -la";
                lst = "exa -s modified -1";
                vim = "nvim";
                con = "mullvad connect";
                disc = "mullvad disconnect";
                rebuild = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg/";
            };
            initExtra = ''
                alias ..='cd ..'
                alias ....='cd ....'
                bindkey -e
                '';
        };
        neovim = {
            enable = true;
            defaultEditor = true;
            extraConfig = import ../nvim/customization.nix;
            extraPackages = [ pkgs.cornelis ];
            plugins = with pkgs.vimPlugins; [
                harpoon
                lualine-nvim
                luasnip
                mini-nvim
                nvim-cmp
                nvim-hs-vim
                nvim-lspconfig
                nvim-treesitter.withAllGrammars
                oil-nvim
                telescope-nvim
                undotree
                vim-highlightedyank
                vimtex
                nvim-cmp
                cmp-nvim-lsp
                plenary-nvim
                vim-fugitive
                vim-obsession

                # agda
                cornelis

                # Themes
                ayu-vim
                catppuccin-nvim
                gruvbox
                kanagawa-nvim
                material-nvim
                nightfox-nvim
                onedark-nvim
                tokyonight-nvim
            ];
        };
        tmux = {
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
                bind R source-file '~/.config/tmux/tmux.conf'
                set-option -g default-shell /run/current-system/sw/bin/zsh
                bind h select-pane -L
                bind j select-pane -D
                bind k select-pane -U
                bind l select-pane -R
                set-option -g pane-border-style fg=\"\#FFFFFF\"
                set -g status-bg gray
                set -g status-fg black

                bind c new-window -c \"\#{pane_current_path}\"
                bind '\"' split-window -c \"\#{pane_current_path}\"
                bind % split-window -h -c \"\#{pane_current_path}\"
                bind C-n next-window
                bind C-p previous-window
                bind a last-window

                set -g @resurrect-strategy-nvim 'session'
                ";
        };
        emacs = {
            enable = true;
            extraPackages = epkgs: with epkgs; [
                magit
                agda2-mode
                agda-input
                evil
                material-theme
                night-owl-theme
            ];
                extraConfig = '' 
                    (menu-bar-mode 0)
                    (tool-bar-mode 0)
                    (scroll-bar-mode 0)
                    (setq display-line-numbers-type 'relative) (global-display-line-numbers-mode)
                    (set-face-attribute 'default nil :family "Julia Mono" :height 130)
                    (evil-mode 1)
                    (load-file (let ((coding-system-for-read 'utf-8))
                               (shell-command-to-string "agda-mode locate"))
                    )
                    (load-theme 'night-owl t)
                    (setq visible-bell t)
                '';
        };
    };
}
