{ config, pkgs, ... }:

{
    home = {
        username = "sebastian";
        homeDirectory = "/home/sebastian";
        stateVersion = "23.05"; # Please read the comment before changing.
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
                htop
                iosevka
                julia-mono
                neofetch
                nerdfonts
                nil
                nixos-option
                obs-studio
                pandoc
                spotify
                hlint
                ripgrep
                stack
                texlive.combined.scheme-basic
                thunderbird
                tmux
                tree
                vlc
                wget
                xclip
                zathura
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
                name = "Julia Mono";
                size = 14;
            };
            theme = "One Dark";
            shellIntegration.enableZshIntegration = true;
            settings = {
                    enable_audio_bell = false;
                    disable_ligatures = true;
                    cursor_shape = "block"; 
                    cursor = "#00AA00";
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
                telescope-nvim
                mini-nvim
                nvim-treesitter.withAllGrammars
                undotree
                lualine-nvim
                vimtex
                harpoon
                nvim-hs-vim
                vim-highlightedyank
                nvim-lspconfig
                oil-nvim
                luasnip
                tmux-nvim
                nvim-cmp

                # Themes
                ayu-vim
                onedark-nvim
                tokyonight-nvim
                catppuccin-nvim
                oxocarbon-nvim
                nightfox-nvim
                papercolor-theme
                solarized-nvim
                {
                    plugin = pkgs.vimPlugins.cornelis;
                }
            ];
        };
        tmux = {
            enable = true;
            prefix = "C-a";
            shell = "${pkgs.zsh}/bin/zsh";
            keyMode = "emacs";
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

                bind C-n next-window
                bind C-p previous-window
                bind a last-window
                ";
        };
    };

}
