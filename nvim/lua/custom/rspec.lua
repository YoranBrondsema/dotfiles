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
      components = { "unique", { "open_output", focus = true, direction = "horizontal" } },
    }
  end,
  condition = {
    filetype = { "ruby" },
  },
})

local function run_rspec_current_file()
  overseer.run_template({ name = "Rspec Current File" })
end

return {
  run_rspec_current_file = run_rspec_current_file,
}
