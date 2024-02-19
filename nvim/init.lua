-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Ctrl-P
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
