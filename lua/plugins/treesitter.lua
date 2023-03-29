return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "css",
      "diff",
      "gitcommit",
      "gitignore",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "typescript",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
