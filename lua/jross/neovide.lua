if vim.g.neovide then
  vim.o.guifont = "FiraCode NF:h14"

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 1
  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_vfx_mode = "sonicboom"

  vim.keymap.set({ "n", "v" }, "<C-v>", [["+P]])
  vim.keymap.set({ "c", "i" }, "<C-v>", "<C-R>+")

  -- Background Transparency Toggle
  local bg_transparency = 0.75
  vim.g.neovide_transparency = bg_transparency
  vim.keymap.set("n", "<leader>bg", function()
    if vim.g.neovide_transparency == 1 then
      vim.api.nvim_set_var("neovide_transparency", bg_transparency)
    else
      vim.api.nvim_set_var("neovide_transparency", 1)
    end
  end)

  -- Font Scale increase/decrease/reset
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<F10>", function()
    vim.api.nvim_set_var("neovide_scale_factor", 1)
  end)
  vim.keymap.set("n", "<F11>", function()
    change_scale_factor(1 / 1.25)
  end)
  vim.keymap.set("n", "<F12>", function()
    change_scale_factor(1.25)
  end)
end
