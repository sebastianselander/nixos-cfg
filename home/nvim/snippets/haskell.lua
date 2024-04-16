local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippets = {}

local qq = s("qq", text("["), insert(1, ""), text("|"), insert(2, ""), text("|]"))
table.insert(snippets, qq)

local lang = s("lang", fmta("{-# LANGUAGE <> #-}", { insert(1, "extension") }))
table.insert(snippets, lang)

local let = s({
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

local main = s({
	trig = "main",
	dscr = "main function",
}, {
	text({ "main :: IO ()", "main = " }),
	insert(1, 'putStrLn "Hello, world!"'),
})
table.insert(snippets, main)

local class = s({
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

local instance = s({
	trig = "instance",
	dscr = "Type class instance",
}, {
	text("instance "),
	insert(1, "Show"),
	insert(2, "Int"),
	text({ " where", "    " }),
	insert(3, ""),
})
table.insert(snippets, instance)

local fn = s({
	trig = "fn",
	dscr = "Make function",
}, {
	rep(1),
	text(" :: "),
	insert(3, "_"),
	text({ "", "" }),
	insert(1, "myFun"),
	text(" = "),
	insert(2, "undefined"),
})
table.insert(snippets, fn)

local newtype = s({
	trig = "newtype",
	dscr = "newtype declaration",
}, {
	text("newtype "),
	insert(1, ""),
	text(" = "),
	rep(1),
	insert(2, ""),
	text({ "", "    deriving (Show, Read, Eq, Ord)" }),
})
table.insert(snippets, newtype)

return snippets
