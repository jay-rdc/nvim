return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Fugitive: Git status" })
    vim.keymap.set("n", "<leader>gs", "<cmd>Gvdiffsplit!<CR>", { desc = "Fugitive: Git diff/merge tool" })
  end
}
