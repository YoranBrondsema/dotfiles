return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- find
    { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    -- grep
    { "<leader>fg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader>fG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  },
}
