local ls = require("luasnip")
local snippet = ls.snippet
local snippet_node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local function_node = ls.function_node
local dynamic = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local repeated = require("luasnip.extras").rep
local choice = ls.choice_node

local snippets = {}

local executable = snippet({
    trig = "executable",
    dscr = "Advent of Code Cabal File Executable"
}, fmt("executable 2024-{}\n  import: day\n  main-is: 2024/{}.hs", {
    insert(1, "00"),
    repeated(1),
})
)

table.insert(snippets, executable)

return snippets
