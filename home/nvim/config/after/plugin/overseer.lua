local overseer = require("overseer")
overseer.setup({})

vim.api.nvim_create_user_command("OverseerRestartLast", function()
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, {})

vim.keymap.set("n", "<leader>oo", "<cmd>OverseerToggle<CR>")
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>")
vim.keymap.set("n", "<space><space>", "<cmd>OverseerRestartLast<CR>")
