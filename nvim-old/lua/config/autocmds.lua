-- ~/.config/nvim/lua/config/autocmds.lua
--
-- Auto-reload any file that has changed on disk ***without*** clobbering
-- your own edits.
--
-- ▸ We create an augroup called “AutoRead” so this set of autocommands
--   can be cleared/re-defined in one shot if you later tweak your config.
--
-- ▸ The autocommand fires on three events:
--     • FocusGained  – you tab back into Neovim
--     • BufEnter     – you switch to another buffer/window
--     • CursorHold   – the cursor sits idle long enough for ‘updatetime’
--
-- ▸ When any of those happen, `:checktime` asks Neovim:
--       “Has this file’s mtime changed on disk?
--        If yes **and** I have no unsaved edits,
--        silently reload the buffer.”
--   If you *do* have edits, Neovim warns instead of overwriting them.
--
local grp = vim.api.nvim_create_augroup("AutoRead", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  command = "checktime",
  group = grp,
  desc = "Reload changed files",
})


