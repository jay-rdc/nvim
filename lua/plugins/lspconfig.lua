return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    -- Diagnostics Settings
    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Mason Setup
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })

    vim.keymap.set("n", "<leader>msn", vim.cmd.Mason, { desc = "Mason: Show dashboard" })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "angularls",
        "cssls",
        "emmet_language_server",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
      },
    })

    -- Set Default Capabilities
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("*", {
      capabilities = lsp_capabilities,
    })
  end
}
