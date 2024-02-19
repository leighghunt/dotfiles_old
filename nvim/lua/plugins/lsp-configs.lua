return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          --"c_sharp",
          --"omnisharp",
          "csharp_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      --lspconfig.omnisharp.setup({})
      --lspconfig.c_sharp.setup({})
      lspconfig.csharp_ls.setup({})
    end,
  },
}
