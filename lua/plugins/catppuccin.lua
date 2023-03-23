return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    custom_highlights = function(colors)
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
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end
}
