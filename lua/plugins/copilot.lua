return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Copilot: Open panel" })
  end
}
