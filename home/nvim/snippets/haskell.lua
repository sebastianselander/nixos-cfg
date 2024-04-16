local ls = require("luasnip")
local snippet = ls.snippet
local snippet_node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local function_node = ls.function_node
local dynamic = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local repeated = require("luasnip.extras").rep

local snippets = {}
local util = {}

util.indent = function()
	if vim.api.nvim_buf_get_option(0, "expandtab") then
		local indent_size = vim.api.nvim_buf_get_option(0, "shiftwidth")
		if indent_size == 0 then
			indent_size = vim.api.nvim_buf_get_option(0, "tabstop")
		end
		return string.rep(" ", indent_size)
	end
	return "\t"
end

util.indent_newline = function(txt) 
	return function()
		return snippet_node(nil, {
			text({ "", util.indent() }),
			insert(1, txt),
		})
	end
end

local qq = snippet("qq", { text("["), insert(1, ""), text("|"), insert(2, ""), text("|]") })
table.insert(snippets, qq)

local lang = snippet("lang", fmta("{-# LANGUAGE <> #-}", { insert(1, "extension") }))
table.insert(snippets, lang)

local let = snippet({
	trig = "let",
	dscr = "let expression",
}, {
	text("let "),
	insert(1, "xs"),
	text(" = "),
	insert(2, "[]"),
	text({ "", " in " }),
	insert(3, "xs"),
})
table.insert(snippets, let)

local main = snippet({
	trig = "main",
	dscr = "main function",
}, {
	text({ "main :: IO ()", "main = " }),
	insert(1, 'putStrLn "Hello, world!"'),
})
table.insert(snippets, main)

local class = snippet({
	trig = "class",
	dscr = "Type class declaration",
}, {
	text("class "),
	insert(1, "Show"),
	insert(2, "a"),
	text({ " where", "    " }),
	insert(3, ""),
})
table.insert(snippets, class)

local instance = snippet({
	trig = "instance",
	dscr = "Type class instance",
}, {
	text("instance "),
	insert(1, "Show"),
	insert(2, "Int"),
	text({ " where", util.indent() }),
	insert(3, ""),
})
table.insert(snippets, instance)

local fn = snippet({
	trig = "fn",
	dscr = "Make function",
}, {
	repeated(1),
	text(" :: "),
	insert(3, "_"),
	text({ "", "" }),
	insert(1, "myFun"),
	text(" = "),
	insert(2, "undefined"),
})
table.insert(snippets, fn)

local newtype = snippet({
	trig = "newtype",
	dscr = "newtype declaration",
}, {
	text("newtype "),
	insert(1, ""),
	text(" = "),
	repeated(1),
	text(" "),
	insert(2, "Int"),
	text({ "", util.indent() .. "deriving (Show, Read, Eq, Ord)" }),
})
table.insert(snippets, newtype)

local case = snippet({
	trig = "case",
	dscr = "Case expression",
}, {
	text("case "),
	insert(1, ""),
	text(" of"),
	dynamic(2, util.indent_newline("_")),
	text(" -> "),
	insert(3, "undefined"),
})

table.insert(snippets, case)

return snippets
