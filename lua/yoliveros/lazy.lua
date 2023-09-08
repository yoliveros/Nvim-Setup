-- Package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        module = "telescope",
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    {
        'navarasu/onedark.nvim',
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'onedark'
            }
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        'windwp/nvim-ts-autotag'
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },  -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    },
    {
        -- IA
        'Exafunction/codeium.vim',
        event = 'BufEnter'
    },
    {
        'theprimeagen/harpoon',
    },
    {
        'mbbill/undotree'
    },
    {
        'tpope/vim-fugitive'
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
            toggler = {
                line = 'gc'
            }
        },
    }
}, {})
