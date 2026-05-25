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

local auto_pair = function(trig, dscr, open, close)
	return s({
		trig = trig,
		dscr = dscr
	}, {
		t(open),
		i(1, ""),
		t(close),
	})
end

local lorem = [[
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
]]

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
    s({
        trig = "lorem",
        namr = "Lorem ipsum",
        dscr = "Lorem ipsum snippet",
    }, {
            f(function() return lorem end, {}),
    }),
    auto_pair("(", "auto pair parens", "(", ")"),
    auto_pair(")", "auto pair parens", "(", ")"),
    auto_pair("[", "auto pair brackets", "[", "]"),
    auto_pair("]", "auto pair brackets", "[", "]"),
    auto_pair("{", "auto pair curly brackets", "{", "}"),
    auto_pair("}", "auto pair curly brackets", "{", "}"),
}
