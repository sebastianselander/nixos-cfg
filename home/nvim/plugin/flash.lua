vim.keymap.set({"n", "o", "x"}, "s", function ()
	require("flash").jump()
end, { desc = "Flash jump"})
