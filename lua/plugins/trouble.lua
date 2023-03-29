return {
  "folke/trouble.nvim",
  opts = {
    signs = {
      information = "󰋽",
    },
  },
  config = function(_, opts)
    require("trouble").setup(opts)

    vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle lsp_references<CR>", { desc = "Trouble: Toggle LSP references" })
    vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble: Toggle diagnostics" })
  end,
}
