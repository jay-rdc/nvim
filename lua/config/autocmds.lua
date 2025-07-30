vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-on-attach-keymaps", {}),
  callback = function(args)
    local opts = function(desc)
      return { buffer = args.buf, remap = false, desc = desc or "" }
    end

    local function custom_hover()
      vim.lsp.buf.hover({
        border = "rounded"
      })
    end

    -- LSP Actions
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("LSP: Go to definition"))
    vim.keymap.set("n", "K", custom_hover, opts("LSP: Hover"))
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts("LSP: Code action"))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("LSP: Rename"))
    vim.keymap.set({ "n", "v" }, "<leader>=", vim.lsp.buf.format, opts("LSP: Format"))
    vim.keymap.set("n", "<leader>lr", function()
      if not pcall(require("telescope.builtin").lsp_references) then
        vim.lsp.buf.references()
      end
    end, opts("LSP: References"))

    -- Diagnostics
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Diagnostics: Go to previous diagnostic"))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Diagnostics: Go to next diagnostic"))
    vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts("Diagnostics: Open float"))
    vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, opts("Diagnostics: Set quickfix list"))
  end,
})
