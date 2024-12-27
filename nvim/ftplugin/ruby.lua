require("overseer").setup()

local overseer = require("overseer")

overseer.register_template({
  name = "Rspec Current File",
  builder = function(params)
    local filename = vim.fn.expand("%")
    if filename == "" then
      vim.api.nvim_err_writeln("No file name detected. Please open a file to run Rspec.")
      return
    end
    return {
      cmd = "rspec",
      args = { filename },
      components = {
        { "open_output", focus = true, direction = "horizontal" },
        { "unique" },
        { "on_exit_set_status" },
      },
    }
  end,
  condition = {
    filetype = { "ruby" },
  },
})

local function run_rspec_current_file()
  overseer.run_template({ name = "Rspec Current File" })
end

vim.keymap.set("n", "<leader>tc", run_rspec_current_file, {
  noremap = true,
  silent = true,
  desc = "Rspec Current File",
})

--- For RSpec
local function replace_current_line(new_line)
  local current_win = vim.api.nvim_get_current_win() -- Get current window
  local cursor = vim.api.nvim_win_get_cursor(current_win) -- Get cursor position
  local row = cursor[1] - 1 -- Adjust row index (Lua is 1-indexed, but Neovim API uses 0-indexed rows)

  -- Replace the line at the cursor position
  -- The third and fourth parameters (row, row+1) specify the range of lines to replace.
  -- The fifth parameter is a table containing the new line.
  vim.api.nvim_buf_set_lines(0, row, row + 1, false, { new_line })
end

local function toggle_focus()
  local current_line = vim.api.nvim_get_current_line()

  if string.match(current_line, ", :focus") then
    replace_current_line(string.gsub(current_line, ", :focus", ""))
  else
    replace_current_line(string.gsub(current_line, "' do", "', :focus do"))
  end
end
vim.keymap.set("n", "<leader>fo", toggle_focus, { noremap = true })
--- add failing spec
vim.keymap.set("n", "<leader>tf", "oexpect(true).to be false<esc>", { noremap = true })

-- Add "--auto-correct-all" to Rubocop
require("conform").formatters.rubocop = {
  args = {
    "--server",
    "--auto-correct-all", -- we replaced the "-a" with "--auto-correct-all"
    "-f",
    "quiet",
    "--stderr",
    "--stdin",
    "$FILENAME",
  },
}
