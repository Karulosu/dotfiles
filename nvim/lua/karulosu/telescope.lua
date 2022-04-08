local key_map = vim.api.nvim_set_keymap
vim.g.nvim_tree_respect_buf_cwd = 1

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require'telescope'.load_extension('project')
require('telescope').load_extension('fzf')

require('telescope').setup {
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
    },
    extensions = {
        project = {
            base_dirs = {
                '~/',
            },
            hidden_files = true -- default: false
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
}

