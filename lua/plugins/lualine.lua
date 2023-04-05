return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local custom_theme = {
      normal = {
        a = "StatusLineSectionA",
        b = "StatusLineSectionB",
        c = { bg = "none" },
      },
      inactive = {
        a = "StatusLineSectionANC",
        b = "StatusLineSectionBNC",
      }
    }

    local function theme_icon()
      local colorscheme_icons = {
        catppuccin = "^ᴖﻌᴖ^",
      }
      return colorscheme_icons[vim.g.colors_name] or ""
    end

    local function theme_icon_component(state)
      local color = state == "inactive" and "StatusLineThemeIconNC" or "StatusLineThemeIcon"
      return {
        theme_icon,
        color = color,
        separator = { left = "", right = "" },
        padding = 0,
      }
    end

    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          theme_icon_component(),
          {
            "FugitiveHead",
            icon = "󰘬",
          },
        },
        lualine_b = {
          {
            "filetype",
            colored = true,
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {
          {
            "filetype",
            colored = false,
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end
}
