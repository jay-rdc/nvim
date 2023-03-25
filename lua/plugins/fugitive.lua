return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Fugitive: Git status" })
    vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", { desc = "Fugitive: Git diff/merge tool" })
    vim.keymap.set("n", "<leader>gl", "<cmd>G log<CR>", { desc = "Fugitive: Git log" })
    if vim.o.ft == "fugitive" then
      vim.keymap.set("n", "<leader>gp", "<cmd>G push<CR>", { desc = "Fugitive: Git push" })
    end
  end
}
