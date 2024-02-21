return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {"rcarriga/nvim-dap-ui"},
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      dapui.setup()

      dap.adapters.coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = {'--interpreter=vscode'}
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net8.0/', 'file')
          end,
        },
      }

--      local dap = require("dap")
      --dap.adapters.coreclr = {
      --  type = "executable",
      --  command = "netcoredbg",
      --  args = { "--interpreter=vscode" },
      --}

      --dap.configurations.cs = {
      --  {
      --    type = "coreclr",
      --    name = "launch - netcoredbg",
      --    request = "launch",
      --    env = "ASPNETCORE_ENVIRONMENT=Development",
      --    args = {
      --      "/p:EnvironmentName=Development", -- this is a msbuild jk
      --      --  this is set via environment variable ASPNETCORE_ENVIRONMENT=Development
      --      "--urls=http://localhost:5002",
      --      "--environment=Development",
      --    },
      --    program = function()
      --      -- return vim.fn.getcwd() .. "/bin/Debug/net8.0/FlareHotspotServer.dll"
      --      local files = ls_dir(get_root_dir() .. "/bin/Debug/")
      --      if #files == 1 then
      --        local dotnet_dir = get_root_dir() .. "/bin/Debug/" .. files[1]
      --        files = ls_dir(dotnet_dir)
      --        for _, file in ipairs(files) do
      --          if file:match(".*%.dll") then
      --            return dotnet_dir .. "/" .. file
      --          end
      --        end
      --      end
      --      -- return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
      --      return vim.fn.input({
      --        prompt = "Path to dll",
      --        default = get_root_dir() .. "/bin/Debug/",
      --      })
      --    end,
      --  },
      --}


      vim.keymap.set('n', '<F5>', dap.continue, {})
      vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {desc="Toggle breakpoint"})
      --vim.keymap.set('n', '<Leader>B', dap.set_breakpoint, {})
      --vim.keymap.set('n', '<Leader>lp', dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')), {})
      vim.keymap.set('n', '<Leader>dr', dap.repl.open, {desc="Open REPL"})
    end,
  },
{
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    ensure_installed = {
--      "python",
--      "netcoredbg",
      "coreclr",
    },
  },
}
}
