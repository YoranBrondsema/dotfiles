return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "comment",
      "css",
      "dockerfile",
      "gitignore",
      "glimmer",
      "graphql",
      "html",
      "javascript",
      "json",
      "lua",
      "ruby",
      "scss",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      -- to ensure we don't have errors when reading the Vim doc
      "vimdoc",
    },
  },
}
