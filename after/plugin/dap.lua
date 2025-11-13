local dap = require('dap')

-- Godot
dap.adapter.godot = {
  type = 'server',
  host = '127.0.0.1',
  port = 6006,
}

dap.configuration.gdscript = {
  {
    type = 'godot',
    request = 'launch',
    name = 'Launch scene',
    project = '${workspaceFolder}'
  }
}
-- Godot
