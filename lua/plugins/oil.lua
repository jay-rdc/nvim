return {
  "stevearc/oil.nvim",
  dependencies = {
    { "nvim-mini/mini.icons", opts = {} },
  },
  opts = {
    view_options = { show_hidden = true },
    confirmation = { border = "rounded" },
    progress = { border = "rounded" },
    keymaps_help = { border = "rounded" },
    preview_win = { preview_method = "load" },
    float = {
      border = "rounded",
      get_win_title = function(winid)
        local cwd = vim.fn.getcwd() .. "/"
        local cwd_escaped = vim.pesc(cwd)
        local buf = vim.api.nvim_win_get_buf(winid)
        local file_path = string.gsub(vim.api.nvim_buf_get_name(buf), "^oil://", "")
        local relative_path = string.gsub(file_path, cwd_escaped, "./")

        return " " .. relative_path .. " "
      end,
    },
    keymaps = {
      ["<C-j>"] = { "actions.preview_scroll_down", mode = "n" },
      ["<C-k>"] = { "actions.preview_scroll_up", mode = "n" },
    },
  },
  config = function(_, opts)
    local oil = require("oil")

    oil.setup(opts)

    vim.keymap.set("n", "<leader>e", oil.toggle_float, { desc = "Oil: File browser" })
  end,
}
