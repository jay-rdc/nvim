return {
  "folke/trouble.nvim",
  keys = {
    { mode = "n", "<leader>tr", "<cmd>TroubleToggle lsp_references<CR>", desc = "Trouble: Toggle Trouble LSP references menu" },
    { mode = "n", "<leader>td", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Trouble: Toggle Trouble diagnostics menu" },
  },
  opts = {
    signs = {
      information = "󰋽",
    },
  },
}
