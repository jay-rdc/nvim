return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local action = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local fb_action = require("telescope").extensions.file_browser.actions

    require("telescope").setup({
      defaults = {
        layout_config = {
          center = {
            preview_cutoff = 0,
          },
        },
        layout_strategy = "center",
        sorting_strategy = "ascending",
        preview = { hide_on_startup = true },
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          n = {
            ["<C-p>"] = action_layout.toggle_preview,
          },
          i = {
            ["<C-p>"] = action_layout.toggle_preview,
            ["<C-j>"] = action.move_selection_next,
            ["<C-k>"] = action.move_selection_previous,
            ["<C-f>"] = action.preview_scrolling_up,
            ["<C-u>"] = false,
            ["<C-n>"] = false,
          },
        },
      },
      extensions = {
        file_browser = {
          path = "%:h",
          mappings = {
            n = {
              t = fb_action.toggle_hidden,
            },
            i = {
              ["<C-t>"] = fb_action.toggle_hidden,
              ["<C-b>"] = fb_action.toggle_browser,
              ["<C-h>"] = fb_action.goto_parent_dir,
              ["<C-l>"] = action.select_default,
              ["<bs>"] = false,
            },
          },
        },
      },
    })
    require("telescope").load_extension("file_browser")

    vim.keymap.set("n", "<leader>e", "<cmd>Telescope file_browser<CR>", { desc = "Telescope: File browser" })
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope: Find in current file" })
    vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope: Find word" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope: Find help tags" })
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Telescope: Find git files" })
    vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files<CR>", { desc = "Telescope: Find files" })
  end
}
