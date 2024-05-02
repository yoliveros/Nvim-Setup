local lsp = require('lsp-zero')

lsp.on_attach(function(cliente, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>ge", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>ne", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>pe", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local lspconfig = require('lspconfig')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'html',
        'clangd',
        'biome',
        'emmet_language_server',
        'cssls',
        'gopls',
        'lua_ls',
        'zls',
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
        end,
    }
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['tsserver'] = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescript.tsx", "typescriptreact", "astro", "svelte" },
        ['html'] = { 'html' },
        ['clangd'] = { 'c', 'cpp' },
        ['gopls'] = { 'go' },
        ['zls'] = { 'zig' },
        ['lua_ls'] = { 'lua' },
    },
})


local cmp = require('cmp')
local cmp_format = lsp.cmp_format()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    formatting = cmp_format,
    mapping = cmp_mappings
})

vim.diagnostic.config({ virtual_text = true })

-- autopair
require('nvim-autopairs').setup()

-- Autotag
require('nvim-ts-autotag').setup()
