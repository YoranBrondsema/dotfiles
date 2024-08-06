return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local icons = LazyVim.config.icons

    local opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },

        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = {},
      },
    }
    return opts
  end,
}
