return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter').install({
      "css",
      "diff",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "typescript",
      "vim",
      "vimdoc",
    })
  end,
}
