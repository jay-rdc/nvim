return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons", lazy = true }
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files" })
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope: Find word" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Find help tags" })
    vim.keymap.set("n", "<leader>fc", builtin.current_buffer_fuzzy_find, { desc = "Telescope: Find in current file" })
  end
}
