local BLUE = "#7AA2F7"
local DARK_TEAL = "#0DB9D7"
local FOREGROUND = "#C0CAF5"
local PURPLE = "#9D7CD8"
local YELLOW_ORANGE = "#FFC66D"
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				light_style = "moon",
				terminal_colors = true,
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				day_brightness = 0.3,
				dim_inactive = false,
				lualine_bold = false,
				on_colors = function(colors)
					colors.comment = "#898FAC"
				end,
				on_highlights = function(hl, colors)
					hl.LineNr = {
						fg = colors.fg_dark,
					}
					hl.CursorLineNr = {
						fg = colors.orange,
					}
					hl.CursorLine = {
						guibg = nil,
						guifg = nil,
					}
					hl.Function = {
						fg = YELLOW_ORANGE,
					}
					hl.Type = {
						fg = DARK_TEAL,
						bold = false,
					}
					hl.Constant = {
						fg = BLUE,
						bold = true,
					}
					hl["@lsp.type.interface"] = {
						fg = DARK_TEAL,
						bold = false,
					}
					hl.PreProc = {
						fg = PURPLE,
					}
					hl.Operator = {
						fg = PURPLE,
						italic = true,
					}

					-- C/C++ Specific Hightlights
					hl.cStructure = {
						fg = PURPLE,
					}
					hl.cTypedef = {
						fg = PURPLE,
					}
					hl.cppNumber = {
						fg = colors.orange,
					}
					hl["@number.c"] = {
						fg = colors.orange,
					}
					hl["@operator.c"] = {
						fg = FOREGROUND,
					}
					hl["@string.escape.c"] = {
						fg = "#73DACA",
					}
					hl["@lsp.type.operator.c"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.type.operator.cpp"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.type.parameter.c"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.type.parameter.cpp"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.type.property.c"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.type.property.cpp"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.typemod.function.defaultLibrary.c"] = {
						fg = YELLOW_ORANGE,
					}
					hl["@lsp.typemod.type.defaultLibrary.c"] = {
						fg = DARK_TEAL,
					}
					hl["@lsp.typemod.type.defaultLibrary.cpp"] = {
						fg = DARK_TEAL,
					}
					hl["@type.builtin.c"] = {
						fg = DARK_TEAL,
					}
					hl["@type.builtin.cpp"] = {
						fg = DARK_TEAL,
					}
					hl["@punctuation.delimiter.c"] = {
						fg = FOREGROUND,
					}

					-- Java Specific Highlights
					hl["@lsp.type.annotation.java"] = {
						fg = "#B4F9E8",
					}
					hl["@lsp.type.namespace.java"] = {
						fg = DARK_TEAL,
					}
					hl.javaClassDecl = {
						fg = PURPLE,
					}
					hl.javaAnnotation = {
						fg = "#B4F9E8",
					}
					hl.javaNumber = {
						fg = colors.orange,
					}
					hl.javaParen = {
						fg = "#7DCFFF",
					}
					hl.javaParen1 = {
						fg = "#7DCFFF",
					}
					hl.Statement = {
						fg = PURPLE,
						italic = true,
					}
					hl.javaConstant = {
						fg = PURPLE,
						italic = true,
					}
					hl["@lsp.type.enumMember.java"] = {
						fg = BLUE,
						bold = true,
					}
					hl["@lsp.typemod.class.public.java"] = {
						fg = DARK_TEAL,
						bold = false,
					}
					hl["@lsp.typemod.enum.public.java"] = {
						fg = DARK_TEAL,
						bold = false,
					}
					hl["@lsp.type.property.java"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.type.variable.java"] = {
						fg = FOREGROUND,
					}
					hl["@lsp.typemod.property.readonly.java"] = {
						fg = BLUE,
						bold = true,
					}
					hl["@lsp.type.parameter.java"] = {
						fg = FOREGROUND,
					}

					-- YAML Specific Highlights
					hl["@property.yaml"] = {
						fg = PURPLE,
					}
					hl["@string.yaml"] = {
						fg = "#A9B1D6",
					}
				end,
				cache = true,

				plugins = {
					all = package.loaded.lazy == nil,
					auto = true,
				},
			})
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
