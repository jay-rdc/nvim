return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
  },
  cmd = "Telescope",
  keys = {
    { mode = "n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Telescope: Find in current file" },
    { mode = "n", "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Telescope: Find word" },
    { mode = "n", "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope: Find help tags" },
    { mode = "n", "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "Telescope: Find git files" },
    { mode = "n", "<leader>fd", "<cmd>Telescope find_files<CR>", desc = "Telescope: Find files" },
  },
  config = function()
    local action = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    require("telescope").setup({
      defaults = {
        layout_config = {
          preview_cutoff = 30,
        },
        layout_strategy = "center",
        sorting_strategy = "ascending",
        preview = { hide_on_startup = true },
        prompt_prefix = " ",
        selection_caret = "󱞪 ",
        mappings = {
          n = {
            ["<M-p>"] = action_layout.toggle_preview,
          },
          i = {
            ["<M-p>"] = action_layout.toggle_preview,
            ["<C-j>"] = action.move_selection_next,
            ["<C-k>"] = action.move_selection_previous,
          },
        },
      },
    })
  end
}
