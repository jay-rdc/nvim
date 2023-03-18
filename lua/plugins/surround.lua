return {
  "kylechui/nvim-surround",
  event = { "BufNewFile", "BufReadPre" },
  version = "*",
  config = function ()
    require("nvim-surround").setup({})
  end
}
