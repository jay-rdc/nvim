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
      return "^ᴖﻌᴖ^"
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
          {
            theme_icon,
            color = "StatusLineThemeIcon",
            separator = { right = "" },
          },
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
        lualine_a = {
          {
            theme_icon,
            color = "StatusLineThemeIconNC",
            separator = { right = "" },
          },
          {
            "FugitiveHead",
            icon = "󰘬",
          },
        },
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
