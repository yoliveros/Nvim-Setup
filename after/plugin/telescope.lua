local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- Shorcut for nvim config files
vim.keymap.set("n", "<leader>nc", function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end)
