if vim.g.neovide then
  vim.o.guifont = "FiraCode NF:h14"
  vim.g.neovide_transparency = 0.75
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_vfx_mode = "sonicboom"

  vim.keymap.set({"n", "v"}, "<C-v>", [["+P]])
  vim.keymap.set({"c", "i"}, "<C-v>", "<C-R>+")
end
