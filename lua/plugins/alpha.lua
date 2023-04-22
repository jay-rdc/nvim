return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local header_text = {
      [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
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
      local date = os.date("󰸘 %B %d, %Y")
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

    local function day_banner()
      local day = os.date("%A")
      local day_banners = {
        Sunday = {
          [[  ______                 _             ]],
          [[ / _____)               | |            ]],
          [[( (____  _   _ ____   __| |_____ _   _ ]],
          [[ \____ \| | | |  _ \ / _  (____ | | | |]],
          [[ _____) ) |_| | | | ( (_| / ___ | |_| |]],
          [[(______/|____/|_| |_|\____\_____|\__  |]],
          [[                                (____/ ]],
        },
        Monday = {
          [[ _______                 _             ]],
          [[(_______)               | |            ]],
          [[ _  _  _  ___  ____   __| |_____ _   _ ]],
          [[| ||_|| |/ _ \|  _ \ / _  (____ | | | |]],
          [[| |   | | |_| | | | ( (_| / ___ | |_| |]],
          [[|_|   |_|\___/|_| |_|\____\_____|\__  |]],
          [[                                (____/ ]],
        },
        Tuesday = {
          [[ _______                   _             ]],
          [[(_______)                 | |            ]],
          [[    _ _   _ _____  ___  __| |_____ _   _ ]],
          [[   | | | | | ___ |/___)/ _  (____ | | | |]],
          [[   | | |_| | ____|___ ( (_| / ___ | |_| |]],
          [[   |_|____/|_____|___/ \____\_____|\__  |]],
          [[                                  (____/ ]],
        },
        Wednesday = {
          [[ _  _  _           _                      _             ]],
          [[(_)(_)(_)         | |                    | |            ]],
          [[ _  _  _ _____  __| |____  _____  ___  __| |_____ _   _ ]],
          [[| || || | ___ |/ _  |  _ \| ___ |/___)/ _  (____ | | | |]],
          [[| || || | ____( (_| | | | | ____|___ ( (_| / ___ | |_| |]],
          [[ \_____/|_____)\____|_| |_|_____|___/ \____\_____|\__  |]],
          [[                                                 (____/ ]],
        },
        Thursday = {
          [[ _______ _                         _             ]],
          [[(_______) |                       | |            ]],
          [[    _   | |__  _   _  ____ ___  __| |_____ _   _ ]],
          [[   | |  |  _ \| | | |/ ___)___)/ _  (____ | | | |]],
          [[   | |  | | | | |_| | |  |___ ( (_| / ___ | |_| |]],
          [[   |_|  |_| |_|____/|_|  (___/ \____\_____|\__  |]],
          [[                                          (____/ ]],
        },
        Friday = {
          [[ _______    _     _             ]],
          [[(_______)  (_)   | |            ]],
          [[ _____ ____ _  __| |_____ _   _ ]],
          [[|  ___) ___) |/ _  (____ | | | |]],
          [[| |  | |   | ( (_| / ___ | |_| |]],
          [[|_|  |_|   |_|\____\_____|\__  |]],
          [[                         (____/ ]],
        },
        Saturday = {
          [[  ______                            _             ]],
          [[ / _____)        _                 | |            ]],
          [[( (____  _____ _| |_ _   _  ____ __| |_____ _   _ ]],
          [[ \____ \(____ (_   _) | | |/ ___) _  (____ | | | |]],
          [[ _____) ) ___ | | |_| |_| | |  ( (_| / ___ | |_| |]],
          [[(______/\_____|  \__)____/|_|   \____\_____|\__  |]],
          [[                                           (____/ ]],
        },
      }
      return {
        type = "text",
        val = day_banners[day],
        opts = {
          position = "center",
          hl = "Type",
        },
      }
    end

    dashboard.config.layout = {
      { type = "padding", val = 4 },
      header,
      { type = "padding", val = 1 },
      info(),
      { type = "padding", val = 3 },
      day_banner(),
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
