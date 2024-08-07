return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "filename",
            file_status = true,
            newfile_status = false,
            path = 1,
          },
        },
        lualine_c = {},

        lualine_x = {},
        lualine_y = { "branch" },
        lualine_z = { "progress" },
      },
    }
    return opts
  end,
}
