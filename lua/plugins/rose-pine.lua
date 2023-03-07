return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      disable_italics = true,
      disable_background = true,
      disable_float_background = true,
      groups = {
        border = "highlight_high"
      },
      highlight_groups = {
        StatusLine = { bg = "none" },
        StatusLineSectionA = { fg = "base", bg = "rose" },
        StatusLineSectionB = { fg = "rose", bg = "surface" },
        StatusLineSectionANC = { fg = "base", bg = "muted" },
        StatusLineSectionBNC = { fg = "muted", bg = "surface" },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end
}
