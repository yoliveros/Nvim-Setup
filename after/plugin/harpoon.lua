local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vip.keymap.set('n', '<leader>a', mark.add_file)
vip.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vip.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vip.keymap.set('n', '<C-j>', function() ui.nav_file(2) end)
vip.keymap.set('n', '<C-k>', function() ui.nav_file(3) end)
vip.keymap.set('n', '<C-l>', function() ui.nav_file(4) end)
