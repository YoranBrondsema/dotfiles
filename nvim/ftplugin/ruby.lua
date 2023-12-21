-- run tests
vim.api.nvim_set_keymap('n', '<leader>tc', ':Dispatch rspec %<CR>', {})

vim.b.ale_linters = {'rubocop', 'sorbet'}
vim.b.ale_fixers = {'rubocop'}

-- splitjoin.vim configuration
vim.g.splitjoin_ruby_curly_braces = 0
vim.g.splitjoin_ruby_hanging_args = 0

local function replace_current_line(new_line)
  local current_win = vim.api.nvim_get_current_win()      -- Get current window
  local cursor = vim.api.nvim_win_get_cursor(current_win) -- Get cursor position
  local row = cursor[1] - 1                               -- Adjust row index (Lua is 1-indexed, but Neovim API uses 0-indexed rows)

  -- Replace the line at the cursor position
  -- The third and fourth parameters (row, row+1) specify the range of lines to replace.
  -- The fifth parameter is a table containing the new line.
  vim.api.nvim_buf_set_lines(0, row, row + 1, false, { new_line })
end


--- For RSpec
local function toggle_focus()
  current_line = vim.api.nvim_get_current_line()

  if string.match(current_line, ", :focus") then
    replace_current_line(string.gsub(current_line, ", :focus", ""))
  else
    replace_current_line(string.gsub(current_line, "' do", "', :focus do"))
  end
end
vim.keymap.set("n", "<leader>fo", toggle_focus, {noremap=true})
--- add failing spec
vim.keymap.set("n", "<leader>tf", "oexpect(true).to be false<esc>", {noremap=true})
