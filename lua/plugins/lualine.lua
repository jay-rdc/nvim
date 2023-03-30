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

    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
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
            "diff",
            source = diff_source,
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
          {
            "diff",
            source = diff_source,
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
