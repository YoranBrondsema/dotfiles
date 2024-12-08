-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.relativenumber = false
vim.opt.wrap = true

vim.opt.colorcolumn = "100"
vim.cmd([[
  highlight ColorColumn ctermbg=0 guibg=#555555
]])

-- turn off LSP logging cause it brings the system to a halt
vim.lsp.set_log_level("off")

-- prevent comments when copy-pasting Ruby
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o", "c" })
  end,
})
