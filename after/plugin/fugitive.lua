vip.keymap.set("n", "<leader>gs", vip.cmd.Git)

local yoliveros_fugitive = vip.api.nvim_create_augroup("yoliveros_fugitive", {})

local autocmd = vip.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = yoliveros_fugitive,
    pattern = "*",
    callback = function()
        if vip.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vip.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        -- push
        vip.keymap.set("n", "<leader>pu", function()
            vip.cmd.Git('push')
        end, opts)

        -- rebase
        vip.keymap.set("n", "<leader>P", function()
            vip.cmd.Git({ 'pull', '--rebase' })
        end, opts)

        -- push origin
        vip.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end
})
