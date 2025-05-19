local _ = require "mason-core.functional"
local path = require("mason-core.path")
local platform = require("mason-core.platform")
local install_dir = vim.fn.expand("$MASON/packages/angular-language-server")

local append_node_modules = _.map(function(dir)
  return path.concat({ dir, "node_modules" })
end)

local function get_cmd(workspace_dir)
  local cmd = {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    table.concat(append_node_modules({ install_dir, workspace_dir }), ","),
    "--ngProbeLocations",
    table.concat(
      append_node_modules({
        path.concat({ install_dir, "node_modules", "@angular", "language-server" }),
        workspace_dir,
      }),
      ","
    ),
  }
  if platform.is.win then
    cmd[1] = vim.fn.exepath(cmd[1])
  end

  return cmd
end

return {
  cmd = get_cmd(vim.loop.cwd()),
  root_markers = { "angular.json", "project.json", "nx.json", ".git" },
}
