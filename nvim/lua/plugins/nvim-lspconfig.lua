return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      sorbet = {
        enabled = true,
      },
      ruby_lsp = {
        enabled = true,
      },
      solargraph = {
        enabled = false,
      },
      rubocop = {
        enabled = true,
      },
      standardrb = {
        enabled = false,
      },
    },
  },
}
