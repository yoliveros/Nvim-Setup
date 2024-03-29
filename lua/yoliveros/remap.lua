vim.g.mapleader = " "
vim.keymap.set("n", "<C-b>", "<C-^>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- move line
vim.keymap.set("v", "J", ":m '>+3<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>Y", [["+Y]])
vim.keymap.set("v", "<leader>y", [["+y]])

vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<CR>", { silent = true })
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- navigate quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

-- make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
