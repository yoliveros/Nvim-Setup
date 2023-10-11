-- Package manager
local lazypath = vip.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vip.loop.fs_stat(lazypath) then
    vip.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vip.opt.rtp:prepend(lazypath)

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
