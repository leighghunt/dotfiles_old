return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      vim.keymap.set('n', '<F5>', dap.continue, {})
      vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<Leader>B', dap.set_breakpoint, {})
      --vim.keymap.set('n', '<Leader>lp', dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')), {})
      vim.keymap.set('n', '<Leader>dr', dap.repl.open, {})
    end,
  },
}
