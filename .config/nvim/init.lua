-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})
vim.g.mapleader = " "
local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end
