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
    ];

    home = {
        file = {
            ".config/kitty/kitty.conf".source = ../kitty/kitty.conf;
            ".ghci".source = ../.ghci;
            # ".config/nvim/init.lua".source = ../nvim/init.lua;
            # ".config/nvim/after/plugin/cmp.lua".source = ../nvim/after/plugin/cmp.lua;
            # ".config/nvim/after/plugin/colorscheme.lua".source = ../nvim/after/plugin/colorscheme.lua;
            # ".config/nvim/after/plugin/cornelis.lua".source = ../nvim/after/plugin/cornelis.lua;
            # ".config/nvim/after/plugin/diffview.lua".source = ../nvim/after/plugin/diffview.lua;
            # ".config/nvim/after/plugin/eyeliner.lua".source = ../nvim/after/plugin/eyeliner.lua;
            # ".config/nvim/after/plugin/fugitive.lua".source = ../nvim/after/plugin/fugitive.lua;
            # ".config/nvim/after/plugin/harpoon.lua".source = ../nvim/after/plugin/harpoon.lua;
            # ".config/nvim/after/plugin/haskell-nvim.lua".source = ../nvim/after/plugin/haskell-nvim.lua;
            # ".config/nvim/after/plugin/haskell-tools.lua".source = ../nvim/after/plugin/haskell-tools.lua;
            # ".config/nvim/after/plugin/init.lua".source = ../nvim/after/plugin/init.lua;
            # ".config/nvim/after/plugin/lspconfig.lua".source = ../nvim/after/plugin/lspconfig.lua;
            # ".config/nvim/after/plugin/lualine.lua".source = ../nvim/after/plugin/lualine.lua;
            # ".config/nvim/after/plugin/luasnip.lua".source = ../nvim/after/plugin/luasnip.lua;
            # ".config/nvim/after/plugin/nvim-tree.lua".source = ../nvim/after/plugin/nvim-tree.lua;
            # ".config/nvim/after/plugin/oil.lua".source = ../nvim/after/plugin/oil.lua;
            # ".config/nvim/after/plugin/onedark.lua".source = ../nvim/after/plugin/onedark.lua;
            # ".config/nvim/after/plugin/telescope.lua".source = ../nvim/after/plugin/telescope.lua;
            # ".config/nvim/after/plugin/toggleterm.lua".source = ../nvim/after/plugin/toggleterm.lua;
            # ".config/nvim/after/plugin/treesitter.lua".source = ../nvim/after/plugin/treesitter.lua;
            # ".config/nvim/after/plugin/truezen.lua".source = ../nvim/after/plugin/truezen.lua;
            # ".config/nvim/after/plugin/undotree.lua".source = ../nvim/after/plugin/undotree.lua;
            # ".config/nvim/after/plugin/vimtex.lua".source = ../nvim/after/plugin/vimtex.lua;
            # ".config/nvim/lua/setup/init.lua".source = ../nvim/lua/setup/init.lua;
            # ".config/nvim/lua/setup/remap.lua".source = ../nvim/lua/setup/remap.lua;
            # ".config/nvim/lua/setup/set.lua".source = ../nvim/lua/setup/set.lua;
        };
    };
}
