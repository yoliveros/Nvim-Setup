-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  --custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set("n", "<leader>m", ":NvimTreeFindFileToggle<CR>")
end


require('nvim-tree').setup({
  on_attach = my_on_attach,
  view = {
    width = '100%'
  },
  actions = {
    open_file = {
      quit_on_open = true
    },
  }
})
