local function open_component_file()
  local current_dir = vim.fn.expand("%:p:h")
  local js_file = current_dir .. "/component.js"
  local ts_file = current_dir .. "/component.ts"

  if vim.fn.filereadable(js_file) == 1 then
    vim.cmd("vsp " .. js_file)
  elseif vim.fn.filereadable(ts_file) == 1 then
    vim.cmd("vsp " .. ts_file)
  else
    print("Neither component.js nor component.ts exists in " .. current_dir)
  end
end

vim.keymap.set("n", "<leader>pc", open_component_file, { noremap = true, silent = true })
