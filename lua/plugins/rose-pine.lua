return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      disable_italics = false,
      disable_background = true,
      disable_float_background = true,
      groups = {
        border = "highlight_high"
      },
      highlight_groups = {
        StatusLine = { bg = "none" },
        StatusLineSectionA = { fg = "base", bg = "rose" },
        StatusLineSectionB = { fg = "rose", bg = "overlay" },
        StatusLineSectionANC = { fg = "base", bg = "muted" },
        StatusLineSectionBNC = { fg = "muted", bg = "overlay" },
        GitSignsChange = { fg = "gold" },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end
}
