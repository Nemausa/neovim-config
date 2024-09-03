local dap = require('dap')
local dapui = require('dapui')

-- Configure nvim-dap-ui
dapui.setup()

local os_name = vim.loop.os_uname().sysname
-- Set up Python adapter
if os_name == 'Linux' then
    dap.adapters.python = {
      type = 'executable',
      command = '/usr/bin/python3.8',
      args = { '-m', 'debugpy.adapter' },
    }

    -- Set up Python configuration
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',  -- Adjust this to the file you want to debug
        pythonPath = function()
          return '/usr/bin/python3.8'
        end,
      },
    }

elseif os_name == 'Windows_NT' then
    dap.adapters.python = {
      type = 'executable',
      command = 'C:\\Python312\\python.exe',
      args = { '-m', 'debugpy.adapter' },
    }

    -- Set up Python configuration
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',  -- Adjust this to the file you want to debug
        pythonPath = function()
          return 'C:\\Python312\\python.exe'
        end,
      },
    }
elseif os_name == "Darwin" then
    dap.adapters.python = {
      type = 'executable',
      command = '/usr/bin/python3.8',
      args = { '-m', 'debugpy.adapter' },
    }
    -- Set up Python configuration
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',  -- Adjust this to the file you want to debug
        pythonPath = function()
          return '/usr/bin/python3.8'
        end,
      },
    }
end
