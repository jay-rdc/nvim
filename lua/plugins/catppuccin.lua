return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function ()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function (colors)
        return {
          LineNr = { fg = colors.surface2 },
          StatusLineSectionA = { fg = colors.crust, bg = colors.pink },
          StatusLineSectionB = { fg = colors.pink, bg = colors.surface0 },
          StatusLineSectionANC = { fg = colors.crust, bg = colors.overlay0 },
          StatusLineSectionBNC = { fg = colors.overlay0, bg = colors.surface0 },
          TelescopeMatching = { fg = colors.peach },
          TelescopeSelection = { fg = colors.text, bold = true },
          TelescopeResultsNormal = { fg = colors.overlay2 },
        }
      end
    })
    vim.cmd("colorscheme catppuccin")
  end
}
