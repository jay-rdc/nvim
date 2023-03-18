return {
  "mbbill/undotree",
  keys = {
    { mode = "n", "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree: Toggle" },
  },
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
