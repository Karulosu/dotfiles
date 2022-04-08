return require("packer").startup {
    function(use, use_rocks)
        -- THEME
        use "gruvbox-community/gruvbox"
        -- STATUSLINE
        use {
            'feline-nvim/feline.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        use "mbbill/undotree"
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
        -- FILE FIND
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }

        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        -- TELESCOPE EXTENSIONS
        -- Project
        use 'nvim-telescope/telescope-project.nvim'
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
        }

        -- LSP
        use "neovim/nvim-lspconfig"
        use 'williamboman/nvim-lsp-installer'
        use "onsails/lspkind-nvim"

        -- COLORS
        use "norcalli/nvim-colorizer.lua"

        -- TODO COMMENTS
        use {"folke/todo-comments.nvim", requires = { {"nvim-lua/plenary.nvim"}}}

        -- TREE FILES
        -- use {
        --     'kyazdani42/nvim-tree.lua',
        --     requires = {
        --         'kyazdani42/nvim-web-devicons', -- optional, for file icon
        --     },
        --     config = function() require'nvim-tree'.setup {} end
        -- }

        -- AUTOCOMPLETION
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use({'hrsh7th/cmp-buffer', after="nvim-cmp"})
    use({'hrsh7th/cmp-path', after="nvim-cmp"})
    use 'L3MON4D3/LuaSnip'
    use({'saadparwaiz1/cmp_luasnip'})

    -- Snipets
    use({'rafamadriz/friendly-snippets'})
    -- MULTICURSOR
    use 'mg979/vim-visual-multi'
    -- Navigation
    use 'ggandor/lightspeed.nvim'
    -- Surronding
    use 'tpope/vim-surround'
    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- Improve ui
    use {'stevearc/dressing.nvim'}
    -- Show keymaps
    use({'mrjones2014/legendary.nvim'})
    use { "nvim-neo-tree/neo-tree.nvim",
        --        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim" 
        },
    }
end,
config = {
    display = {
        open_fn = require("packer.util").float,
    },
},
}
