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

    local function custom_button(shortcut, text, keybind, keybind_opts)
      local button = dashboard.button(shortcut, text, keybind, keybind_opts)
      button.opts.cursor = 6
      return button
    end

    local find_tool = {
      type = "group",
      position = "center",
      val = {
        { type = "text", val = "Find Tool (Telescope)", opts = { hl = "Conceal", position = "center" } },
        custom_button("SPC fd", "󰱼  Find File"),
        custom_button("SPC fw", "󰈬  Find Word"),
        custom_button("SPC fg", "󰊢  Find Git Files"),
      },
    }

    local other_tools = {
      type = "group",
      position = "center",
      val = {
        { type = "text", val = "Other Tools", opts = { hl = "Conceal", position = "center" } },
        custom_button("SPC mo", "󰸕  Bookmark Menu (Harpoon)"),
        custom_button("SPC lz", "󰒲  Plugins Dashboard (Lazy)"),
        custom_button("SPC msn", "󰟾  LSP Dashboard (Mason)"),
      },
    }

    local misc = {
      type = "group",
      position = "center",
      val = {
        { type = "text", val = "Misc", opts = { hl = "Conceal", position = "center" } },
        custom_button("e", "󰝒  New File", "<cmd>ene<CR>"),
        custom_button("Restart computer", "󰍃  Quit", ""),
      },
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
