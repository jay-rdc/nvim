return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function ()
    require("catppuccin").setup {
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function (colors)
        return {
          StatusLineSectionA = { fg = colors.crust, bg = colors.pink },
          StatusLineSectionB = { fg = colors.pink, bg = colors.surface0 },
          StatusLineSectionANC = { fg = colors.crust, bg = colors.overlay0 },
          StatusLineSectionBNC = { fg = colors.overlay0, bg = colors.surface0 },
        }
      end
    }
    vim.cmd("colorscheme catppuccin")
  end
}
