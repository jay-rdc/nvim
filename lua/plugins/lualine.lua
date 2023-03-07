return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  config = function ()
    local rose_pine = {
      base = "#191724",
      surface = "#1f1d2e",
      overlay = "#26233a",
      muted = "#6e6a86",
      subtle = "#908caa",
      text = "#e0def4",
      love = "#eb6f92",
      gold = "#f6c177",
      rose = "#ebbcba",
      pine = "#31748f",
      foam = "#9ccfd8",
      iris = "#c4a7e7",
      highlight_low = "#21202e",
      highlight_med = "#403d52",
      highlight_high = "#524f67",
    }

    local custom_theme = {
      normal = {
        a = { fg = rose_pine.base, bg = rose_pine.rose },
        b = { fg = rose_pine.rose, bg = rose_pine.surface },
      },

      inactive = {
        a = { fg = rose_pine.base, bg = rose_pine.muted },
        b = { fg = rose_pine.muted, bg = rose_pine.surface},
        c = { bg = "none" },
      }
    }

    require("lualine").setup {
      options = {
        theme = custom_theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "filename",
            icon = "",
            file_status = true,
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
            "filename",
            icon = "",
            file_status = true,
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
      }
    }
  end
}
