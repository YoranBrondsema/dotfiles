vim.api.nvim_set_keymap(
  "n",
  "<leader>tc",
  ':lua require("custom.rspec").run_rspec_current_file()<CR>',
  { noremap = true, silent = true }
)
