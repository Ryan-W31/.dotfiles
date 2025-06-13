local _border = "rounded"

local lsps = { "bashls", "clangd", "jdtls", "lua_ls", "marksman", "html", "pyright", "yamlls" }
vim.lsp.enable(lsps)

vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
			completeion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	},
	root_markers = { ".git" },
})

return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		opts = {
			ui = {
				border = _border,
			},
			registries = { "github:mason-org/mason-registry", "github:nvim-java/mason-registry" },
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			--- @diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				ensure_installed = lsps,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		cmd = "Mason",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
}
