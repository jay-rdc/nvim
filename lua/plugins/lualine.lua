return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  config = function ()
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

    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
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
        },
        lualine_b = {
          {
            "FugitiveHead",
            icon = "󰘬",
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
            "filetype",
            colored = false,
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
          },
        },
        lualine_b = {
          {
            "FugitiveHead",
            icon = "󰘬",
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
