-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.hlsearch=true

lvim.plugins={
  'nicholasmata/nvim-dap-cs', dependencies = { 'mfussenegger/nvim-dap' }
}

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
