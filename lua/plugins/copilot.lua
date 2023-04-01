return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      TelescopePrompt = false,
    }
    vim.g.copilot_no_tab_map = true

    vim.keymap.set("i", "<Tab>", "<Tab>")
    vim.api.nvim_set_keymap("i", "<M-l>", [[copilot#Accept("")]], { expr = true, silent = true, desc = "Copilot: Accept" })
    vim.keymap.set("n", "<leader>cp", "<cmd>Copilot panel<CR>", { desc = "Copilot: Open panel" })
  end
}
