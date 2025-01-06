local theme = require('catppuccin')

theme.setup({
  flavour = 'mocha',
  color_overrides = {
    mocha = {
      base = '#000000',
      mantle = '#000000',
      crust = '#000000',
    }
  },
  integrations = {
    nvimtree = {
      transparent_panel = true
    }
  }
})

vim.cmd.colorscheme("catppuccin")

-- color background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
