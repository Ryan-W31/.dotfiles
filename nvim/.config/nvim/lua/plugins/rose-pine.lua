return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},
			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
			palette = {},
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
			before_highlight = function(group, hightlight, palette) end,
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
