local function DiagCount(diagnostics)
  local severity_count = {
    ERROR = 0,
    WARN = 0,
    HINT = 0,
    INFO = 0,
  }
  for _, diag_value in pairs(diagnostics) do
    for severity_count_key, severity_count_value in pairs(severity_count) do
      if diag_value.severity == vim.diagnostic.severity[severity_count_key] then
        severity_count[severity_count_key] = severity_count_value + 1
      end
    end
  end
  return severity_count
end

local statusline_diagnostics = vim.api.nvim_create_augroup("Statusline Diagnostics", { clear = true })
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = statusline_diagnostics,
  callback = function (args)
    local diag_count = DiagCount(args.data.diagnostics)
    for key, count in pairs(diag_count) do
      if count ~= 0 then
        vim.b[key.."_COUNT"] = count
      else
        vim.b[key.."_COUNT"] = nil
      end
    end
  end
})

local branch_name = "%( 󰘬 %{FugitiveHead()} |%)"
local file_name = "%(  %t%)%( %m%)"

local error_count = "%1*%( %{get(b:, 'ERROR_COUNT', '')} %)"
local warn_count = "%2*%( %{get(b:, 'WARN_COUNT', '')} %)"
local hint_count = "%3*%(󰌶 %{get(b:, 'HINT_COUNT', '')} %)"
local info_count = "%4*%(󰋽 %{get(b:, 'INFO_COUNT', '')} %)"
local diag_count = "%( | " .. error_count..warn_count..hint_count..info_count .. "%)"

vim.opt.statusline = branch_name .. file_name .. diag_count
