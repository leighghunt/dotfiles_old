return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c_sharp",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
}

--  "nvim-treesitter/nvim-treesitter",
--  opts = function(_, opts)
--    vim.list_extend(opts.ensure_installed, {
--      "c_sharp",
--    })
--  end,
--}
