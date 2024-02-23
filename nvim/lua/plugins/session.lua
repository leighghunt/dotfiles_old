return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup ({
      auto_session_suppress_dirs = {'~/', "~/Downloads/"}, -- don't save sessions in these dirs
      session_lens = {

      },
      vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
        noremap = true,
        silent = true
      }),
    })
  end
}
