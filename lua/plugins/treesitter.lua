return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufNewFile", "BufReadPre" },
  dependencies = { "nvim-treesitter/nvim-treesitter-angular" },
  cmd = {
    "TSInstall",
    "TSInstallSync",
    "TSInstallInfo",
    "TSModuleInfo",
    "TSUninstall",
    "TSUpdateSync",
    "TSUpdate",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
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
        "rust",
        "typescript",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
