return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local fb_extension = require("telescope").extensions.file_browser
    local fb_actions = fb_extension.actions
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    local show_preview_on_startup = {
      preview = { hide_on_startup = false },
    }

    require("telescope").setup({
      defaults = {
        layout_config = {
          center = {
            preview_cutoff = 0,
            width = 0.6,
          },
        },
        layout_strategy = "center",
        sorting_strategy = "ascending",
        preview = { hide_on_startup = true },
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<A-p>"] = actions_layout.toggle_preview,
            ["<C-f>"] = actions.preview_scrolling_up,
            ["<C-u>"] = false,
          },
        },
      },
      pickers = {
        current_buffer_fuzzy_find = show_preview_on_startup,
        live_grep = show_preview_on_startup,
        lsp_references = show_preview_on_startup,
      },
      extensions = {
        file_browser = {
          path = "%:h",
          mappings = {
            i = {
              ["<C-b>"] = fb_actions.toggle_browser,
            },
          },
        },
        ["ui-select"] = {
          themes.get_cursor(),
        },
      },
    })
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("ui-select")

    vim.keymap.set("n", "<leader>e", fb_extension.file_browser, { desc = "Telescope: File browser" })
    vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Telescope: Find in current file" })
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope: Find word" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Find help tags" })
    vim.keymap.set("n", "<leader>fd", function()
      if not pcall(builtin.git_files, { show_untracked = true }) then
        builtin.find_files()
      end
    end, { desc = "Telescope: Find files" })
  end
}
