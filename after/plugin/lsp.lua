local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vip.keymap.set("n", "gd", function() vip.lsp.buf.definition() end, opts)
    vip.keymap.set("n", "K", function() vip.lsp.buf.hover() end, opts)
    vip.keymap.set("n", "<leader>vws", function() vip.lsp.buf.workspace_symbol() end, opts)
    vip.keymap.set("n", "<leader>ge", function() vip.diagnostic.open_float() end, opts)
    vip.keymap.set("n", "[d", function() vip.diagnostic.goto_next() end, opts)
    vip.keymap.set("n", "]d", function() vip.diagnostic.goto_prev() end, opts)
    vip.keymap.set("n", "<leader>vca", function() vip.lsp.buf.code_action() end, opts)
    vip.keymap.set("n", "<leader>vrr", function() vip.lsp.ruf.references() end, opts)
    vip.keymap.set("n", "<F2>", function() vip.lsp.buf.rename() end, opts)
    vip.keymap.set("i", "<C-h>", function() vip.lsp.buf.signature_help() end, opts)
end)

local lspconfig = require('lspconfig')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'html',
        'eslint',
        'svelte',
        'emmet_language_server',
        'cssls',
        'gopls',
        'lua_ls',
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
        end,
        tsserver = function()
            -- local tsserver_opts = lsp.tsserver()
            lspconfig.tsserver.setup({
                settings = {
                    completion = {
                        semi = false,
                        singleQuote = false,
                        arrowParens = 'avoid',
                    }
                }
            })
        end
    }
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['tsserver'] = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
        ['html'] = { 'html' },
        ['svelte'] = { 'svelte' },
        ['gopls'] = { 'go' },
        ['rust_analyzer'] = { 'rust' },
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

vip.diagnostic.config({ virtual_text = true })
