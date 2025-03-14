return {
  {
    "folke/tokyonight.nvim",
    lazy = false, 
    priority = 1000, 
    config = function()
      require("tokyonight").setup {
        style="night",
        light_style = "moon",
        terminal_colors=true,
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
            fg = colors.fg_dark
          }
          hl.CursorLineNr = {
            fg = colors.orange
          }
          hl.CursorLine = {
            guibg = nil,
            guifg = nil,
          }
          hl.Function = {
            fg = "#FFC66D",
          }
          hl.Type = {
            fg = "#0DB9D7",
            bold = false,
          }
          hl["@lsp.type.interface"] = {
            fg = "#0DB9D7",
            bold = false,
          }
          hl.PreProc = {
            fg = "#9D7CD8",
          }
          hl.Operator = {
            fg = "#9D7CD8",
            italic = true,
          }
          hl["@lsp.type.annotation.java"] = {
            fg = "#B4F9E8",
          }
          hl["@lsp.type.namespace.java"] = {
            fg = "#0DB9D7",
          }
          hl.javaClassDecl = {
            fg = "#9D7CD8"
          }
          hl.javaAnnotation = {
            fg = "#B4F9E8",
          }
          hl.javaParen = {
            fg = "#7DCFFF",
          }
          hl.javaParen1 = {
            fg = "#7DCFFF",
          }
          hl.Statement = {
            fg = "#9D7CD8",
            italic = true,
          }
          hl.javaConstant = {
            fg = "#9D7CD8",
            italic = true,
          }
          hl["@lsp.type.enumMember.java"] = {
            fg = "#7AA2F7",
            bold = true,
          }
          hl["@lsp.typemod.class.public.java"] = {
            fg = "#0DB9D7",
            bold = false,
          }
          hl["@lsp.typemod.enum.public.java"] = {
            fg = "#0DB9D7",
            bold = false,
          }
          hl["@lsp.type.property.java"] = {
            fg = "#C0CAF5"
          }
          hl["@lsp.type.variable.java"] = {
            fg = "#C0CAF5"
          }
          hl["@lsp.typemod.property.readonly.java"] = {
            fg = "#7AA2F7",
            bold = true,
          }
          hl["@lsp.type.parameter.java"] = {
            fg = "#C0CAF5"
          }
        end,
        cache = true,

        plugins = {
            all = package.loaded.lazy == nil,
            auto = true,
        },
      }
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  }
}
