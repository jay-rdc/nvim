return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v1.x",
  event = { "BufNewFile", "BufReadPre" },
  cmd = "Mason",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    {
      "williamboman/mason.nvim", -- Optional
      keys = {
        { mode = "n", "<leader>msn", vim.cmd.Mason, desc = "Mason: Show dashboard" },
      },
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },         -- Required
    { "hrsh7th/cmp-nvim-lsp" },     -- Required
    { "hrsh7th/cmp-buffer" },       -- Optional
    { "hrsh7th/cmp-path" },         -- Optional
    { "saadparwaiz1/cmp_luasnip" }, -- Optional
    { "hrsh7th/cmp-nvim-lua" },     -- Optional

    -- Snippets
    { "L3MON4D3/LuaSnip" },             -- Required
    { "rafamadriz/friendly-snippets" }, -- Optional
  },
  config = function()
    require("mason.settings").set({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "",
          package_pending = "󰳠",
          package_uninstalled = "󰝦",
        },
      },
    })

    local lsp = require("lsp-zero").preset({
      name = "minimal",
      set_lsp_keymaps = false,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
    })

    lsp.ensure_installed({
      "angularls",
      "cssls",
      "eslint",
      "html",
      "jsonls",
      "lua_ls",
      "tsserver",
    })

    lsp.configure("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    local css_lint_rules = {
      lint = {
        unknownAtRules = "ignore",
      },
    }
    lsp.configure("cssls", {
      settings = {
        css = css_lint_rules,
        scss = css_lint_rules,
      },
    })

    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ["<C-h>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-l>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
      ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),

      ["<Tab>"] = vim.NIL,
      ["<S-Tab>"] = vim.NIL,
    })

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    })

    lsp.set_preferences({
      sign_icons = {
        error = "󰅚",
        warn = "󰀪",
        hint = "󰌶",
        info = "󰋽"
      },
    })

    ---@diagnostic disable-next-line: unused-local
    lsp.on_attach(function(client, bufnr)
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
      vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float({ focusable = true }) end,
        opts("Diagnostics: Open float"))
      vim.keymap.set("n", "<leader>dq", function() vim.diagnostic.setqflist() end,
        opts("Diagnostics: Add diagnostics in quickfixlist"))
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts("Diagnostics: Go to previous diagnostic"))
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts("Diagnostics: Go to next diagnostic"))
    end)

    lsp.setup()

    local cmp_config = lsp.defaults.cmp_config({
      window = {
        completion = cmp.config.window.bordered()
      }
    })

    cmp.setup(cmp_config)

    vim.diagnostic.config({
      virtual_text = true
    })
  end
}
