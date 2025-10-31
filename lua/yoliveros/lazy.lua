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
    'lewis6991/gitsigns.nvim'
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      theme = 'catppuccin',
      styles = {
        sidebars = "transparent",
        floats = "transparent"
      },
      on_colors = function(colors)
        colors.bg_statusline = "#FFFFFF"
      end,
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
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  },
  {
    'mbbill/undotree'
  },
  { 'windwp/nvim-ts-autotag' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
  },
  {
    'numToStr/Comment.nvim',
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'brenoprata10/nvim-highlight-colors',
  },
  {
    "seblyng/roslyn.nvim",
    opts = {
      filewatching = 'roslyn',
      broad_search = true,
      lock_target = true,
    },
  },
  {
    "supermaven-inc/supermaven-nvim",
  }
}, {})
