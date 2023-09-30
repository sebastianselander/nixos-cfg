{ pkgs, ... }:

{
    home = {
        username = "sebastian";
        homeDirectory = "/home/sebastian";
        stateVersion = "23.05";
        language.base = "en_US.UTF-8";
        sessionVariables = {
            EDITOR = "nvim";
        };
        packages = with pkgs; [
                (agda.withPackages [ agdaPackages.standard-library ])
                bat
                cabal-install
                cabal2nix
                cargo
                discord
                dmenu
                eza
                feh
                firefox
                gcc
                gh
                ghc
                ghcid
                gnumake
                haskell-language-server
                haskellPackages.BNFC
                haskellPackages.alex
                haskellPackages.happy
                hlint
                htop
                ibm-plex
                iosevka
                julia-mono
                just
                libreoffice
                neofetch
                nerdfonts
                nil
                nix-prefetch-git
                nixos-option
                obs-studio
                pandoc
                qbittorrent
                ripgrep
                roboto
                spotify
                stack
                texlive.combined.scheme-full
                thunderbird
                tree
                unzip
                victor-mono
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
                name = "Victor Mono Nerd Font Mono";
                size = 14;
            };
            theme = "Material Dark";
            extraConfig = ''disable_ligatures always''; # + builtins.readFile ../kitty/kitty-themes/themes/Kanagawa.conf;
            shellIntegration.enableZshIntegration = true;
            settings = {
                    enable_audio_bell = false;
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
                    success_symbol = "[-- INSERT --\nλ](bold green)";
                    error_symbol = "[-- INSERT --\nΛ](bold red)";
                    vimcmd_symbol = "[-- NORMAL --\nλ](bold green)";
                    vimcmd_replace_one_symbol = "[-- REPLACE --\nλ](bold green)";
                    vimcmd_replace_symbol = "[-- REPLACE --\nλ](bold green)";
                    vimcmd_visual_symbol = "[-- VISUAL --\nλ](bold green)";
                };
                git_status = {
                    format="([\\[ $conflicted$stashed$deleted$renamed$modified$staged$untracked$ahead_behind\\]]($style))";
                    conflicted = "conflict=\${count} ";
                    stashed = "stashed=\${count} ";
                    deleted = "deleted=\${count} ";
                    renamed = "renamed=\${count} ";
                    behind = "behind=\${count} ";
                    ahead = "ahead=\${count} ";
                    diverged = "ahead=\${count} behind=\${count} ";
                    untracked = "untracked=\${count} ";
                    modified = "modified=\${count} ";
                    staged = "staged=\${count} ";
                };
            };
        };
        zathura = {
            enable = true;
            options = {
                recolor = true;
                scroll-step = 50;
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
                ls  = "eza --group-directories-first";
                lsa = "eza --group-directories-first -la";
                lst = "eza -s modified -1";
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
                ls  = "eza --group-directories-first";
                lsa = "eza --group-directories-first -la";
                lst = "eza -s modified -1";
                vim = "nvim";
                con = "mullvad connect";
                disc = "mullvad disconnect";
                rebuild-plasma = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg/";
                zenbook-xmonad = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg#zenbook-xmonad"; 
                pc-xmonad = "sudo nixos-rebuild switch --flake ~/Documents/git/nixos-cfg#pc-xmonad"; 
            };
            initExtra = ''
                alias ..='cd ..'
                alias ....='cd ....'
                bindkey -v
                KEYTIMEOUT=1
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
                hop-nvim

                # agda
                cornelis

                # Themes
                catppuccin-nvim
                gruvbox
                kanagawa-nvim
                material-nvim
                nightfox-nvim
                onedark-nvim
                tokyonight-nvim
                palenight-vim
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
        doom-emacs = {
            enable = true;
            doomPrivateDir = ../doom.d;
        };
        # emacs = {
        #     enable = true;
        #     extraPackages = epkgs: with epkgs; [
        #         magit
        #         agda2-mode
        #         agda-input
        #         evil
        #         material-theme
        #         night-owl-theme
        #         doom-themes
        #         lsp-mode
        #         which-key
        #         corfu
        #         counsel
        #         flycheck
        #         haskell-mode
        #         lua-mode
        #     ];
        #         extraConfig = ''
        #             (menu-bar-mode 0)
        #             (tool-bar-mode 0)
        #             (scroll-bar-mode 0)
        #             (setq display-line-numbers-type 'relative) (global-display-line-numbers-mode)
        #             (set-face-attribute 'default nil :family "Victor Mono Nerd Font Mono" :height 131)
        #             (setq evil-want-C-u-scroll t)
        #             (setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
        #                 version-control t
        #                 delete-old-versions t
        #                 kept-new-versions 20
        #                 kept-old-versions 5
        #             )

        #             (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

        #             (add-hook 'after-init-hook #'global-flycheck-mode)
        #             (global-flycheck-mode t)
        #             (global-font-lock-mode t)
        #             (setq font-lock-maximum-decoration t)

        #             (global-corfu-mode 1)
        #             (setq completion-cycle-threshold 3)
        #             (setq tab-always-indent 'complete)
        #             (ivy-mode 1)
        #             (evil-mode 1)
        #             (load-file (let ((coding-system-for-read 'utf-8))
        #                        (shell-command-to-string "agda-mode locate"))
        #             )
        #             (load-theme 'material t)
        #             (setq visible-bell t)
        #         '';
        # };
    };
}
