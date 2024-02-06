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
		"for",
		fmta("for (int <> = 0; <> << <>; <>++) {\n    <>\n}", {
			i(1, "i"),
			rep(1),
			i(2, ""),
			rep(1),
			i(3, ""),
		})
	),
	s(
		"printf",
		fmta([[printf("<>\n", <>);]], {
			i(1, ""),
			i(2, ""),
		})
	),
	s(
		"sprintf",
		fmta([[sprintf("<>\n", <>);]], {
			i(1, ""),
			i(2, ""),
		})
	),
	s(
		"fprintf",
		fmta([[fprintf("<>\n", <>);]], {
			i(1, ""),
			i(2, ""),
		})
	),
	s("main",
		fmta("int main(int argc, char **argv) {\n    <>\n}", {
			i(1, "")
		})
	),
}
