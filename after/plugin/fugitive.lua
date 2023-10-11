vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local yoliveros_fugitive = vim.api.nvim_create_augroup("yoliveros_fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
	group = yoliveros_fugitive,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }
		-- push
		vim.keymap.set("n", "<leader>pu", function()
			vim.cmd.Git('push')
		end, opts)

		-- rebase
		vim.keymap.set("n", "<leader>P", function()
			vim.cmd.Git({ 'pull', '--rebase' })
		end, opts)

		-- push origin
		vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
	end
})
