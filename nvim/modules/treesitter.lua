require'nvim-treesitter.configs'.setup {
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
  },
  highlight = {
    enable = true,
    disable = {
      -- we use vim-terraform for syntax coloring
      "terraform"
    },
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
}
