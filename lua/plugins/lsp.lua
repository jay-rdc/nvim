return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- LSP and Diagnostics Settings
    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = "",
      })
    end

    sign({ name = "DiagnosticSignError", text = "󰅚" })
    sign({ name = "DiagnosticSignWarn", text = "󰀪" })
    sign({ name = "DiagnosticSignHint", text = "󰌶" })
    sign({ name = "DiagnosticSignInfo", text = "󰋽" })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "rounded", }
    )

    -- Mason Dashboard
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "",
          package_pending = "󰳠",
          package_uninstalled = "󰝦",
        },
      },
    })

    vim.keymap.set("n", "<leader>msn", vim.cmd.Mason, { desc = "Mason: Show dashboard" })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "angularls",
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "tsserver",
      },
    })

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    ---@diagnostic disable-next-line: unused-local
    local lsp_attach = function(client, bufnr)
      local opts = function(desc)
        return { buffer = bufnr, remap = false, desc = desc or "" }
      end

      -- LSP Actions
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts("LSP: Go to definition"))
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("LSP: Hover"))
      vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts("LSP: Code action"))
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("LSP: Rename"))
      vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts("LSP: References"))
      vim.keymap.set({ "n", "v" }, "<leader>=", function() vim.lsp.buf.format() end, opts("LSP: Format"))

      -- Diagnostics
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts("Diagnostics: Go to previous diagnostic"))
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts("Diagnostics: Go to next diagnostic"))
      vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts("Diagnostics: Open float"))
      vim.keymap.set("n", "<leader>dq", function() vim.diagnostic.setqflist() end, opts("Diagnostics: Set quickfix list"))
    end

    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end,
      ["cssls"] = function()
        local css_lint_rules = {
          lint = {
            unknownAtRules = "ignore",
          },
        }
        lspconfig.cssls.setup({
          settings = {
            css = css_lint_rules,
            scss = css_lint_rules,
          },
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end,
    })
  end
}
