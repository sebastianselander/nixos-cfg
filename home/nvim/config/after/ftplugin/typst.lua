vim.bo.makeprg = "typst compile %"

vim.api.nvim_create_user_command("TypstPin", function()
	local client = vim.lsp.get_clients({ name = "tinymist", bufnr = 0 })[1]
    if client == nil then 
        vim.notify("Tinymist: missing", vim.log.levels.WARN)
        return
    end
	client:exec_cmd({
		title = "Pin typst file",
		command = "tinymist.pinMain",
		arguments = { vim.api.nvim_buf_get_name(0) },
	})
end, {})
