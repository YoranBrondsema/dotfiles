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
    "toml",
    "tsx",
    "typescript",
    "vim",
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {
      "terraform"
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
}
