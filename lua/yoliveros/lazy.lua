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
        'nvim-treesitter/nvim-treesitter-context',
    },
    {
        'windwp/nvim-ts-autotag'
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
    },
    -- LSP
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },

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
    },
    {
        'numToStr/Comment.nvim',
    },
}, {})
