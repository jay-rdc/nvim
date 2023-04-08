return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header
    local header_text = {
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
    }

    local header = {
      type = "text",
      val = header_text,
      opts = {
        position = "center",
        hl = "String",
      },
    }

    local function info()
      local date = os.date("󰸘 %A - %B %d, %Y")
      local lazy_stats = require("lazy").stats()
      local loaded_plugins = "󰢻 " .. lazy_stats.count .. " plugins"
      local version = vim.version()
      local nvim_version_info = "󰓼 v" .. version.major .. "." .. version.minor .. "." .. version.patch

      local info_string = date .. "  |  " .. loaded_plugins .. "  |  " .. nvim_version_info

      return {
        type = "text",
        val = info_string,
        opts = {
          position = "center",
          hl = "Identifier",
        },
      }
    end

    local function adjust_button(button)
      button.opts.cursor = 6
      return button
    end

    local find_tool = {
      type = "group",
      val = {
        { type = "text", val = "Find Tool (Telescope)", opts = { hl = "Conceal", position = "center" } },
        adjust_button(dashboard.button("SPC fd", "󰱼  Find File")),
        adjust_button(dashboard.button("SPC fw", "󰈬  Find Word")),
        adjust_button(dashboard.button("SPC fg", "󰊢  Find Git Files")),
      },
      position = "center",
    }

    local other_tools = {
      type = "group",
      val = {
        { type = "text", val = "Other Tools", opts = { hl = "Conceal", position = "center" } },
        adjust_button(dashboard.button("SPC mo", "󰸕  Bookmark Menu (Harpoon)")),
        adjust_button(dashboard.button("SPC lz", "󰒲  Plugins Dashboard (Lazy)")),
        adjust_button(dashboard.button("SPC msn", "󰟾  LSP Dashboard (Mason)")),
      },
      position = "center",
    }

    local misc = {
      type = "group",
      val = {
        { type = "text", val = "Misc", opts = { hl = "Conceal", position = "center" } },
        adjust_button(dashboard.button("e", "󰝒  New File", "<cmd>ene<CR>")),
        adjust_button(dashboard.button("Restart computer", "󰍃  Quit", "")),
      },
      position = "center",
    }

    dashboard.config.layout = {
      { type = "padding", val = 4 },
      header,
      { type = "padding", val = 1 },
      info(),
      { type = "padding", val = 2 },
      find_tool,
      { type = "padding", val = 2 },
      other_tools,
      { type = "padding", val = 2 },
      misc,
    }

    alpha.setup(dashboard.config)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.wo.fillchars = "eob: "
      end,
    })
  end,
}
