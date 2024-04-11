local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})

-- Shorcut for nvim config files
vim.keymap.set("n", "<leader>nc", function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end)
