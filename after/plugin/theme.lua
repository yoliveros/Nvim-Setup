local theme = require('catppuccin')

theme.setup({
  flavour = 'mocha',
  color_overrides = {
    mocha = {
      base = '#000000',
      mantle = '#000000',
      crust = '#000000',
    },
  },
})

vim.cmd.colorscheme("catppuccin")
