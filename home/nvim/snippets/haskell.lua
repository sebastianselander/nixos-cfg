local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s("lang", fmta("{-# LANGUAGE <> #-}", { i(1, "extension") })),
	s("let", fmta("let <> = <>\nin <>", { i(1, ""), i(2, ""), i(3, "") })),
	s("main", fmta("main :: IO ()\nmain = <>", { i(1, "undefined") })),
}
