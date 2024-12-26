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

-- Go to definition (gd) and show definition in a split
-- For vertical split
vim.keymap.set("n", "<leader>vd", function()
  vim.cmd("vsplit")
  vim.lsp.buf.definition()
end, { noremap = true })
-- For horizontal split
vim.keymap.set("n", "<leader>hd", function()
  vim.cmd("split")
  vim.lsp.buf.definition()
end, { noremap = true })
