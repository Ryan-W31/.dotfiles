return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main",
			styles = {
				transparency = true,
			},
			highlight_groups = {
				javaClassDecl = { fg = "pine", italic = true },
				javaOperator = { fg = "pine", italic = true },

				["@lsp.mod.readonly.java"] = { fg = "gold", bold = true },

				["@lsp.type.enumMember.java"] = { fg = "gold", bold = true },
				["@lsp.type.interface.java"] = { fg = "foam", italic = true },
				["@lsp.type.modifier.java"] = { fg = "pine", italic = true },
				["@lsp.type.parameter.java"] = { fg = "text" },
				["@lsp.type.property.java"] = { fg = "text" },

				["@lsp.typemod.class.public.java"] = { link = "@lsp.type.class.java", inherit = true },

				cppStructure = { fg = "pine", italic = true },
				cStorageClass = { fg = "pine", italic = true },
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
