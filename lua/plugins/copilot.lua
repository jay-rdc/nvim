return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      TelescopePrompt = false,
      text = false,
    }
    vim.keymap.set("i", "<Tab>", "<Tab>")
    vim.api.nvim_set_keymap("i", "<C-j>", [[copilot#Accept("<Right>")]], { expr = true, silent = true, desc = "Copilot: Accept" })

    vim.g.copilot_no_tab_map = true
  end
}
