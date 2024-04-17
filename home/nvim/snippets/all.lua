local ls = require("luasnip")
local s = ls.s
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local choice = ls.choice_node

local iso8601 = function()
	return os.date("%Y-%m-%d")
end

local date_ugly = function()
	return os.date("%d/%m - %Y")
end

return {
	s({
		trig = "date",
		namr = "Date",
		dscr = "Date in the format YYYY-MM-DD",
	}, {
		choice(1, {
			f(iso8601, {}),
			f(date_ugly, {}),
		}),
	}),
	s({
		trig = "ss",
		namr = "Date",
		dscr = "",
	}, {
		t("Sebastian Selander"),
	}),
}
