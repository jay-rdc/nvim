return {
  "folke/trouble.nvim",
  keys = {
    { mode = "n", "<leader>tr", "<cmd>TroubleToggle lsp_references<CR>", desc = "Trouble: Toggle LSP references" },
    { mode = "n", "<leader>td", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Trouble: Toggle diagnostics" },
  },
  opts = {
    signs = {
      information = "󰋽",
    },
  },
}
