-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.colorcolumn = "100"
vim.cmd([[
  highlight ColorColumn ctermbg=red guibg=#ffcccc
]])

vim.opt.relativenumber = false
vim.opt.wrap = true
