return {
  "github/copilot.vim",
  enabled = false,
  config = function()
    vim.g.copilot_filetypes = {
      TelescopePrompt = false,
      text = false,
    }
    vim.g.copilot_no_tab_map = true

    vim.keymap.set("i", "<Tab>", "<Tab>")
    vim.api.nvim_set_keymap("i", "<Right>", [[copilot#Accept("<Right>")]], { expr = true, silent = true, desc = "Copilot: Accept" })
  end
}
