require("telescope").setup {
    defaults = {
        file_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    },
}

vim.api.nvim_set_keymap('n', '<leader>ff',  [[<cmd>Telescope find_files<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg',  [[<cmd>Telescope live_grep<cr>]], { noremap = true, silent = true })
