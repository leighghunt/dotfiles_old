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

      vim.keymap.set('n', '<F5>', dap.continue, {})
      vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {desc="Toggle breakpoint"})
      vim.keymap.set('n', '<Leader>dr', dap.repl.open, {desc="Open REPL"})
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "coreclr",
      },
    },
  },
  {
    'nicholasmata/nvim-dap-cs', dependencies = { 'mfussenegger/nvim-dap' },

    config = function()
      require('dap-cs').setup(
        -- Additional dap configurations can be added.
        -- dap_configurations accepts a list of tables where each entry
        -- represents a dap configuration. For more details do:
        -- :help dap-configuration
        dap_configurations == {
          {
            -- Must be "coreclr" or it will be ignored by the plugin
            type = "coreclr",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        netcoredbg == {
          -- the path to the executable netcoredbg which will be used for debugging.
          -- by default, this is the "netcoredbg" executable on your PATH.
          path = "netcoredbg"
        }
      )
    end
  },
  -- { -- This plugin
  --   "Zeioth/compiler.nvim",
  --   cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
  --   dependencies = { "stevearc/overseer.nvim" },
  --   opts = {},
  -- },
  -- { -- The task runner we use
  --   "stevearc/overseer.nvim",
  --   commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
  --   cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
  --   opts = {
  --     task_list = {
  --       direction = "bottom",
  --       min_height = 25,
  --       max_height = 25,
  --       default_detail = 1
  --     },
  --   },
  -- },
}
