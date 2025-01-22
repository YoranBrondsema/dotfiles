local lspconfig = require("lspconfig")

local function is_sutori_backend(root_dir)
  return root_dir == "/Users/yoranbrondsema/Projects/Sutori/sutori/backend"
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      sorbet = {
        enabled = true,
        cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
        on_new_config = function(new_config, root_dir)
          -- disable for Sutori cause it's causing problems
          if is_sutori_backend(root_dir) then
            new_config.enabled = false
          end
        end,
      },
      ruby_lsp = {
        enabled = true,
        on_new_config = function(new_config, root_dir)
          -- disable for Sutori cause it's causing problems
          if is_sutori_backend(root_dir) then
            new_config.enabled = false
          end
        end,
      },
      solargraph = {
        enabled = false,
      },
      rubocop = {
        enabled = true,
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
      },
      standardrb = {
        enabled = false,
      },
    },
  },
}
