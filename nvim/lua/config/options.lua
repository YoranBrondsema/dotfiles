-- Prettier is not used if there's no config file.
vim.g.lazyvim_prettier_needs_config = true

-- Ruby
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Thorfile",
  command = "setlocal ft=ruby",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.thor",
  command = "setlocal ft=ruby",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Fastfile",
  command = "setlocal ft=ruby",
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Dangerfile",
  command = "setlocal ft=ruby",
})
