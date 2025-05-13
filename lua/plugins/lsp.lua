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
        "ts_ls",
      },
    })

    -- LSP Keymaps on attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-on-attach-keymaps", {}),
      callback = function(args)
        local opts = function(desc)
          return { buffer = args.buf, remap = false, desc = desc or "" }
        end

        local function custom_hover()
          vim.lsp.buf.hover({
            border = "rounded"
          })
        end

        -- LSP Actions
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("LSP: Go to definition"))
        vim.keymap.set("n", "K", custom_hover, opts("LSP: Hover"))
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts("LSP: Code action"))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("LSP: Rename"))
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts("LSP: References"))
        vim.keymap.set({ "n", "v" }, "<leader>=", vim.lsp.buf.format, opts("LSP: Format"))

        -- Diagnostics
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Diagnostics: Go to previous diagnostic"))
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Diagnostics: Go to next diagnostic"))
        vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts("Diagnostics: Open float"))
        vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, opts("Diagnostics: Set quickfix list"))
      end,
    })

    -- Language Server Setups

    -- Default
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    vim.lsp.config("*", {
      capabilities = lsp_capabilities,
    })

    -- Lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- CSS
    local css_lint_rules = {
      lint = {
        unknownAtRules = "ignore",
      },
    }
    vim.lsp.config("cssls", {
      settings = {
        css = css_lint_rules,
        scss = css_lint_rules,
      },
    })

    -- Angular
    vim.lsp.config("angularls", {
      root_markers = { "angular.json", "project.json" },
    })
  end
}
