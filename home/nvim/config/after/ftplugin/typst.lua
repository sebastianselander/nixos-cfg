vim.bo.makeprg = "typst compile %"


vim.api.nvim_create_user_command("TypstPin", function()
	vim.lsp.buf.execute_command({ command = "tinymist.pinMain", arguments = { vim.api.nvim_buf_get_name(0) } })
end, {})
