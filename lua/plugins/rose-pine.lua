return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      disable_italics = true,
      disable_background = true,
      disable_float_background = true,
      highlight_groups = {
        StatusLine = { fg = "rose", bg = "base" },
        User1 = { fg = "love", bg = "base" },
        User2 = { fg = "gold", bg = "base" },
        User3 = { fg = "iris", bg = "base" },
        User4 = { fg = "foam", bg = "base" },
      },
    })
    vim.cmd("colorscheme rose-pine")
  end
}
