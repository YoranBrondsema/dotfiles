local lspconfig = require("lspconfig")

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
