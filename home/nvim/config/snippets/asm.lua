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
		"printf",
		fmta("mov $printfstring, %RDI\nmov $0, %RAX\nmov <>, %RSI\ncall printf", {
			i(1, "VALUE"),
		})
	),
	s("printfstring", fmt("printfstring:\n.string \"<0x%016lx\\n>\"", {})),
}
