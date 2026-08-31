local cmp = require("cmp")

-- cmp.setup({
-- })
local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 60
local MAX_KIND_WIDTH = 14

local get_ws = function (max, len)
  return (" "):rep(max - len)
end

local format = function(_, item)
  local content = item.abbr
  -- local kind_symbol = symbols[item.kind]
  -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

  if #content > MAX_LABEL_WIDTH then
    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
  else
    item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
  end

  return item
    
end

cmp.setup({
	formatting = {
		format = format,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({
			max_width = 50,
		}),
		documentation = cmp.config.window.bordered({
			max_width = 50,
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-b>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-j>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item()
			end
		end),
		["<C-k>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			end
		end),
	}),
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "latex_symbols", option = { strategy = 0 } },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline", option = {
			ignore_cmds = { "Man", "!" },
		} },
	}),
})
