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
		"print",
		fmta("print(<>);", {
			i(1, ""),
		})
	),
	s(
		"fori",
		fmta("for <> in range(<>):\n    <>", {
			i(1, "i"),
			i(2, ""),
			i(3, "pass"),
		})
	),
	s(
		"main",
		fmta("if __name__ == \"__main__\":\n    <>", {
			i(1, "main()"),
		})
	),
	s(
		"while",
		fmta("while <>:\n    <>", {
			i(1, "1"),
			i(2, "pass"),
		})
	),
	s(
		"if",
		fmta("if <>:\n    <>", {
			i(1, ""),
			i(2, ""),
		})
	),
	s(
		"ifelse",
		fmta("if <>:\n    <>\nelse:    <>", {
			i(1, ""),
			i(2, "pass"),
			i(3, "pass"),
		})
	),
}
