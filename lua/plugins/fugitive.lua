return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Fugitive: Open git status in new horizontal window" });
    vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit, { desc = "Fugitive: Open current git file changes in new vertical window" });
  end
}
