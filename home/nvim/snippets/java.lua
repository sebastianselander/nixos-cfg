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
	s(
		"sout",
		fmta("System.out.println(<>);", {
			i(1, ""),
		})
	),
	s(
		"fori",
		fmta("for (int <> = 0; <> << <>; <>++) {\n    <>\n}", {
			i(1, "i"),
			rep(1),
			i(2, ""),
			rep(1),
			i(3, ""),
		})
	),
	s("Main", fmta("class Main {\n<>\n}", i(1, ""))),
	s(
		"main",
		fmta("public static void main(String[] args) {\n    <>\n}", {
			i(1, ""),
		})
	),
	s(
		"while",
		fmta("while (<>) {\n    <>\n}", {
			i(1, "1"),
			i(2, ""),
		})
	),
	s(
		"if",
		fmta("if (<>) {\n    <>\n}", {
			i(1, ""),
			i(2, ""),
		})
	),
	s(
		"ifelse",
		fmta("if (<>) {\n    <>\n} else {\n    <>\n}", {
			i(1, ""),
			i(2, ""),
			i(3, ""),
		})
	),
}
