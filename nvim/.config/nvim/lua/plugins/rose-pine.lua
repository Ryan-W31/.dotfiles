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
				CursorLine = { bg = "NONE" },
				Visual = { bg = "iris", blend = 30 },

				javaClassDecl = { fg = "pine", italic = true },
				javaConditional = { fg = "pine", italic = true },
				javaConstant = { fg = "pine", italic = true },
				javaExternal = { fg = "pine", italic = true },
				javaException = { fg = "pine", italic = true },
				javaMethodDecl = { fg = "pine", italic = true },
				javaOperator = { fg = "pine", italic = true },
				javaStatement = { fg = "pine", bold = false, italic = true },

				["@lsp.mod.readonly.java"] = { fg = "iris", bold = true },
				["@lsp.type.enumMember.java"] = { fg = "iris", bold = true },

				["@lsp.type.annotation.java"] = { fg = "iris" },
				["@lsp.type.interface.java"] = { fg = "foam", italic = true },
				["@lsp.type.modifier.java"] = { fg = "pine", italic = true },
				["@lsp.type.parameter.java"] = { fg = "text" },
				["@lsp.type.property.java"] = { fg = "text" },

				["@lsp.typemod.class.public.java"] = { fg = "foam", bold = false },
				["@lsp.typemod.enum.public.java"] = { fg = "foam", bold = false },
				["@lsp.typemod.method.public.java"] = { fg = "rose", bold = false },
			},
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
