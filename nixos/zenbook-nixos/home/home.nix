{ pkgs, ... }:

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
        home-manager.enable = true;
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
            enableSyntaxHighlighting = true;
            shellAliases = {
                gs = "git status";
                gc = "git commit";
                gf = "git fetch";
                gp = "git push";
                ga = "git add";
                cfg = "cd ~/.config";
                ls = "exa --group-directories-first";
                lsa = "exa --group-directories-first -la";
                lst = "exa -s modified -1";
                vim = "nvim";
                con = "mullvad connect";
                disc = "mullvad disconnect";
            };
            initExtra = ''
                alias ..='cd ..'
                alias ....='cd ....'
                bindkey -e
                '';
        };
    };

    home.packages = with pkgs; [
            agda
            alex
            bat
            blueberry
            btop
            discord
            dmenu
            exa
            feh
            firefox
            flameshot
            gcc
            gh
            ghcid
            happy
            haskell-language-server
            htop
            iosevka
            julia-mono
            kitty
            lutris
            neofetch
            neovim
            neovim
            nerdfonts
            networkmanagerapplet
            nil
            nitrogen
            nixos-option
            obs-studio
            pandoc
            pcmanfm
            polybarFull
            texlive.combined.scheme-basic
            thunderbird
            tmux
            tree
            wget
            wine
            xclip
            xmonad-log
            ];

    home.file = {
    };

    home.sessionVariables = {
        EDITOR = "nvim";
    };
}
