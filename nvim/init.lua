-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
print("SET mapleader", vim.g.mapleader)
require("config.lazy")

require("config.options")
require("config.keymaps")
