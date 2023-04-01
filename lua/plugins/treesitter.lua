return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "css",
      "diff",
      "git_config",
      "git_rebase",
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
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  },
}
