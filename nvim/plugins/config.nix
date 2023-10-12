let

cmp = builtins.readFile ./cmp.lua;
colorscheme = builtins.readFile ./colorscheme.lua;
cornelis = builtins.readFile ./cornelis.lua;
fugitive = builtins.readFile ./fugitive.lua;
gitsigns = builtins.readFile ./gitsigns.lua;
harpoon = builtins.readFile ./harpoon.lua;
haskell-nvim = builtins.readFile ./haskell-nvim.lua;
lspconfig = builtins.readFile ./lspconfig.lua;
lualine = builtins.readFile ./lualine.lua;
luasnip = builtins.readFile ./luasnip.lua;
mini= builtins.readFile ./mini.lua;
oil = builtins.readFile ./oil.lua;
onedark = builtins.readFile ./onedark.lua;
surround = builtins.readFile ./surround.lua;
tabby = builtins.readFile ./tabby.lua;
telescope = builtins.readFile ./telescope.lua;
tokyonight = builtins.readFile ./tokyonight.lua;
treesitter = builtins.readFile ./treesitter.lua;
undotree = builtins.readFile ./undotree.lua;
vimtex = builtins.readFile ./vimtex.lua;

in
''
${cmp}
${colorscheme}
${cornelis}
${fugitive}
${gitsigns}
${harpoon}
${haskell-nvim}
${lspconfig}
${lualine}
${luasnip}
${mini}
${oil}
${onedark}
${surround}
${tabby}
${telescope}
${tokyonight}
${treesitter}
${undotree}
${vimtex}
''
