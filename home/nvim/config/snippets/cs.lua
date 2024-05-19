local ls = require("luasnip")
local sn = ls.snippet_node
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		"Console",
		fmta("Console.WriteLine(<>);", {
			i(1, ""),
		})
	),
    s(
        "main",
        fmta("void Main() {\n<>}", {
            i(1, ""),
        })
    ),
    s(
    ),
}
