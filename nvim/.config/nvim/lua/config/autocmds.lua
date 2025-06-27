local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.lua" },
	desc = "Auto-format Lua files after saving",
	callback = function()
		local fileName = vim.api.nvim_buf_get_name(0)
		vim.cmd(":silent !stylua " .. fileName)
	end,
	group = autocmd_group,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf

		vim.keymap.set("n", "<leader>cf", function()
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end, { buffer = args.bufnr, desc = "Format Code" })

		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
		vim.keymap.set("n", "<leader>crn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
		vim.keymap.set("n", "<leader>cdo", vim.diagnostic.open_float, { buffer = bufnr, desc = "Code Diagnostic Open" })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,

	vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#F6C177" }),
})
