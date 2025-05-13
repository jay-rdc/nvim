return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", version = "1.11.0" },
    { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
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

    -- Mason Dashboard
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

    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    ---@diagnostic disable-next-line: unused-local
    local lsp_attach = function(client, bufnr)
      local opts = function(desc)
        return { buffer = bufnr, remap = false, desc = desc or "" }
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
      ["angularls"] = function()
        lspconfig.angularls.setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
          root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json")
        })
      end,
    })
  end
}
