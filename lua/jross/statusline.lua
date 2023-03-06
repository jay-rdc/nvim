local branch_name = "%( 󰘬 %{FugitiveHead()} |%)"
local file_name = "%(  %t%)%( %m%)"

-- vim.opt.signcolumn = "yes"
vim.opt.statusline = branch_name .. file_name
