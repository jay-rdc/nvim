return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' }, -- Optional
    { 'hrsh7th/cmp-path' }, -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' }, -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' }, -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    local lsp = require('lsp-zero')

    lsp.preset('recommended')

    lsp.ensure_installed({
      'tsserver',
      'eslint',
      'rust_analyzer',
      'lua_ls',
    })

    lsp.configure('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })

    lsp.set_preferences({
      sugguest_lsp_servers = false,
      sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
      }
    })

    ---@diagnostic disable-next-line: unused-local
    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set('n', '<leader>a', function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)

    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true
    })
  end
}
