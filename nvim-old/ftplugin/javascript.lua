local function open_handlebars_template_file()
  local current_dir = vim.fn.expand("%:p:h")
  local hbs_file = current_dir .. "/template.hbs"

  if vim.fn.filereadable(hbs_file) == 1 then
    vim.cmd("vsp " .. hbs_file)
  else
    print("template.hbs does not exist in " .. current_dir)
  end
end
vim.keymap.set("n", "<leader>pt", open_handlebars_template_file, { noremap = true, silent = true })
