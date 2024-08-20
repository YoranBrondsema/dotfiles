vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, { desc = "Next Diagnostic" })
vim.keymap.set({ "n", "v" }, "<leader>l", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

vim.keymap.set("n", "<leader>r", ":%s/<C-r><C-w>/", { desc = "Replace current word" })

-- Copilot
vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)")
