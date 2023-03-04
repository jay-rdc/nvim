if vim.g.neovide then

  vim.o.guifont = "FiraCode NF:h14"

  local bg_transparency = 0.75
  vim.g.neovide_transparency = bg_transparency

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 1
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_vfx_mode = "sonicboom"

  vim.keymap.set({"n", "v"}, "<C-v>", [["+P]])
  vim.keymap.set({"c", "i"}, "<C-v>", "<C-R>+")
  vim.keymap.set("n", "<leader>bg", function ()
    if vim.g.neovide_transparency == 1 then
      vim.api.nvim_set_var("neovide_transparency", bg_transparency)
    else
      vim.api.nvim_set_var("neovide_transparency", 1)
    end
  end)
end
