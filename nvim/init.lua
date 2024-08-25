-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.relativenumber = false
vim.opt.wrap = true

vim.opt.colorcolumn = "100"
vim.cmd([[
  highlight ColorColumn ctermbg=0 guibg=#555555
]])
