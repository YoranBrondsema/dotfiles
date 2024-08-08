return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local winbar = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }

    local opts = {
      winbar = winbar,
      inactive_winbar = winbar,
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
        lualine_y = {},
        lualine_z = { "progress" },
      },
    }
    return opts
  end,
}
