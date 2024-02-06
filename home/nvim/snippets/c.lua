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
		{
			name = "For loop",
			dscr = "For loop with automatic inserting of declared variable",
			trig = "for",
		},
		fmta(
			[[
            for (int <> = 0; <> << <>; <>++) {
                <>
	        } ]],
			{
				i(1, "i"),
				rep(1),
				i(2, "SIZE"),
				rep(1),
				i(3, ""),
			}
		)
	),
	s(
		{
			name = "Printf",
			dscr = "Printf",
			trig = "printf",
		},
		fmta([[ printf("<>\n", <>);]], {
			i(1, ""),
			i(2, ""),
		})
	),
	s(
		{
			name = "Sprintf",
			dscr = "Sprintf",
			trig = "sprintf",
		},
		fmta([[ sprintf("<>\n", <>);]], {
			i(1, ""),
			i(2, ""),
		})
	),
	s(
		{
			name = "Fprintf",
			dscr = "Fprintf",
			trig = "fprintf",
		},
		fmta([[ fprintf("<>\n", <>);]], {
			i(1, ""),
			i(2, ""),
		})
	),
}
