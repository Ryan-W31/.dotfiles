return {
  {
    "folke/tokyonight.nvim",
    lazy = false, 
    priority = 1000, 
    config = function()
      require("tokyonight").setup {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
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
            guibg = NONE,
            guifg = NONE
          }
        end,
      }
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  }
}
