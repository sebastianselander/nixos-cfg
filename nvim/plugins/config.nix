let

cmp = builtins.readFile ./cmp.lua;
colorscheme = builtins.readFile ./colorscheme.lua;
cornelis = builtins.readFile ./cornelis.lua;
diffview = builtins.readFile ./diffview.lua;
fugitive = builtins.readFile ./fugitive.lua;
harpoon = builtins.readFile ./harpoon.lua;
haskell-nvim = builtins.readFile ./haskell-nvim.lua;
haskell-tools = builtins.readFile ./haskell-tools.lua;
lspconfig = builtins.readFile ./lspconfig.lua;
lualine = builtins.readFile ./lualine.lua;
luasnip = builtins.readFile ./luasnip.lua;
nvim-tree = builtins.readFile ./nvim-tree.lua;
oil = builtins.readFile ./oil.lua;
onedark = builtins.readFile ./onedark.lua;
telescope = builtins.readFile ./telescope.lua;
toggleterm = builtins.readFile ./toggleterm.lua;
treesitter = builtins.readFile ./treesitter.lua;
undotree = builtins.readFile ./undotree.lua;
vimtex = builtins.readFile ./vimtex.lua;

in
''
${cmp}
${colorscheme}
${cornelis}
${diffview}
${fugitive}
${harpoon}
${haskell-nvim}
${haskell-tools}
${lspconfig}
${lualine}
${luasnip}
${nvim-tree}
${oil}
${onedark}
${telescope}
${toggleterm}
${treesitter}
${undotree}
${vimtex}
''
