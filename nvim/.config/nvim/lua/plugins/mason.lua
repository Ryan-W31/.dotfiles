local _border = "rounded"
return {
	{
		"williamboman/mason.nvim",
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
				-- Replace the language servers listed here
				-- with the ones you want to install
				ensure_installed = {
					"clangd",
					"markdown_oxide",
					"lua_ls",
					"bashls",
					"jsonls",
					"pyright",
					"yamlls",
					"jdtls",
				},
			})
		end,
	},
}
