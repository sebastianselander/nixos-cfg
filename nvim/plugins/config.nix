let

colorscheme = builtins.readFile ./colorscheme.lua;
cornelis = builtins.readFile ./cornelis.lua;
fugitive = builtins.readFile ./fugitive.lua;
harpoon = builtins.readFile ./harpoon.lua;
haskell-nvim = builtins.readFile ./haskell-nvim.lua;
haskell-tools = builtins.readFile ./haskell-tools.lua;
lspconfig = builtins.readFile ./lspconfig.lua;
lualine = builtins.readFile ./lualine.lua;
luasnip = builtins.readFile ./luasnip.lua;
mini= builtins.readFile ./mini.lua;
oil = builtins.readFile ./oil.lua;
onedark = builtins.readFile ./onedark.lua;
telescope = builtins.readFile ./telescope.lua;
treesitter = builtins.readFile ./treesitter.lua;
undotree = builtins.readFile ./undotree.lua;
vimtex = builtins.readFile ./vimtex.lua;
hop = builtins.readFile ./hop.lua;

in
''
${colorscheme}
${cornelis}
${fugitive}
${harpoon}
${haskell-nvim}
${haskell-tools}
${hop}
${lspconfig}
${lualine}
${luasnip}
${mini}
${oil}
${onedark}
${telescope}
${treesitter}
${undotree}
${vimtex}
''
