local ls = require("luasnip")
local snippet = ls.snippet
local snippet_node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local function_node = ls.function_node
local dynamic = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local repeated = require("luasnip.extras").rep
local choice = ls.choice_node

local snippets = {}
local util = {}


util.recursive = function()
	return snippet_node(nil, {
		choice(1, {
			text({ "" }),
			snippet_node(nil, {
				dynamic(1, util.indent_newline_insert("_"), {}),
				text(" -> undefined"),
				dynamic(2, util.recursive, {}),
			}),
		}),
	})
end

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
			text({ "", util.indent() .. txt }),
		})
	end
end

util.indent_newline_insert = function(txt)
	return function()
		return snippet_node(nil, {
			text({ "", util.indent() }),
			insert(1, txt),
		})
	end
end

local qq = snippet("qq", { text("["), insert(1, ""), text("|"), insert(2, ""), text("|]") })
table.insert(snippets, qq)

local lang = snippet("lang", fmt("{{-# LANGUAGE {a} #-}}", { a = insert(1, "extension") }))
table.insert(snippets, lang)

local if_expr = snippet({
	trig = "if",
	dscr = "If expression",
}, {
	text("if "),
	insert(1),
	text(" then "),
	insert(2),
	text(" else "),
	insert(3),
})
table.insert(snippets, if_expr)

local if_expr_multiline = snippet({
	trig = "iff",
	dscr = "If expression",
}, {
	text("if "),
	insert(1),
	dynamic(2, util.indent_newline("then ")),
	insert(3),
	dynamic(4, util.indent_newline("else ")),
	insert(5),
})
table.insert(snippets, if_expr_multiline)

local if_expr_multiway = snippet({
	trig = "ifmw",
	dscr = "If multi way",
}, {
	text("if "),
	dynamic(1, util.indent_newline("| ")),
	insert(2),
	text(" -> "),
	insert(3),
	dynamic(4, util.indent_newline("| ")),
	insert(5),
	text(" -> "),
	insert(6),
	dynamic(7, util.indent_newline("| otherwise -> ")),
	insert(8),
})

table.insert(snippets, if_expr_multiway)

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
	dynamic(3, util.indent_newline("deriving (Show, Read, Eq, Ord)")),
})
table.insert(snippets, newtype)

local case = snippet({
	trig = "case",
	dscr = "Case expression",
}, {
	text("case "),
	insert(1, "<expr>"),
	text(" of"),
	dynamic(2, util.indent_newline_insert("_")),
	text(" -> undefined"),
    dynamic(3, util.recursive, {}),
})

table.insert(snippets, case)

local lambda_case = snippet({
	trig = "lamcase",
	dscr = "test",
}, {
	text( "\\case "),
	dynamic(1, util.indent_newline_insert("_"), {}),
	text(" -> undefined"),
	dynamic(2, util.recursive, {}),
})

table.insert(snippets, lambda_case)

return snippets
