return {
  "numToStr/Comment.nvim",
  event = { "BufNewFile", "BufReadPre" },
  config = function()
    require("Comment").setup({
      toggler = {
        line = "<C-_><C-_>",
        block = "<C-b><C-b>",
      },
      opleader = {
        line = "<C-_>",
        block = "<C-b>",
      },
      extra = {
        above = "<C-_>O",
        below = "<C-_>o",
        eol = "<C-_>A",
      },
    })
  end
}
