{ config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the paths it should
# manage.
    home.username = "sebastian";
    home.homeDirectory = "/home/sebastian";

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
    home.stateVersion = "23.05"; # Please read the comment before changing.

        home.language.base = "en_US.UTF-8";

    nixpkgs = {
        config = {
            allowUnfree = true;
        };
    };

    fonts.fontconfig.enable = true;

    programs = {
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
                ls = "exa --group-directories-first";
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
            plugins = with pkgs.vimPlugins; [
                telescope-nvim
                telescope-fzf-native-nvim
                nvim-treesitter.withAllGrammars
                undotree
                vim-surround
                vim-commentary
                lualine-nvim
                vimtex
                harpoon
                nvim-hs-vim
                vim-repeat
                vim-highlightedyank
                nvim-colorizer-lua
                nvim-lspconfig
                plenary-nvim
                diffview-nvim
                oil-nvim
                luasnip
                tmux-nvim
                nvim-cmp
                toggleterm-nvim
                colorbuddy-nvim
                ayu-vim
                onedark-nvim
                tokyonight-nvim
                catppuccin-nvim
                oxocarbon-nvim
                nightfox-nvim
                papercolor-theme
                solarized-nvim
                kmonad-vim
            ];
        };
        tmux = {
            enable = true;
            shortcut = "s";
            keyMode = "emacs";
            clock24 = true;
            terminal = "screen-256color";
            extraConfig =
                "
                set-option -g default-shell /run/current-system/sw/bin/zsh
                bind h select-pane -L
                bind j select-pane -D
                bind k select-pane -U
                bind l select-pane -R
                ";
        };
    };

    home.packages = with pkgs; [
            agda
            alex
            bat
            btop
            discord
            dmenu
            exa
            feh
            firefox
            gcc
            gh
            ghcid
            happy
            haskell-language-server
            htop
            iosevka
            julia-mono
            kitty
            neofetch
            nerdfonts
            nil
            nixos-option
            obs-studio
            pandoc
            texlive.combined.scheme-basic
            thunderbird
            tmux
            tree
            wget
            xclip
            vlc
            ripgrep
            ghc
            cabal-install
            stack
    ];

    home = {
        file = {
            ".config/kitty/kitty.conf".source = ../kitty/kitty.conf;
            ".ghci".source = ../.ghci;
        };
    };
}
