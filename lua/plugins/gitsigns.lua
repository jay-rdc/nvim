return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, left, right, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, left, right, opts)
        end

        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        map({ "n", "v" }, "<leader>hs", gs.stage_hunk)
        map({ "n", "v" }, "<leader>hr", gs.reset_hunk)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hp", gs.preview_hunk)

        map({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<CR>")
      end
    }
  end
}
