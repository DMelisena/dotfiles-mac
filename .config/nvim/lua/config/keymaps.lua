-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- resize with arrows
vim.keymap.set("n", "<A-Down>", "<cmd>resize -4<cr>", { desc = "Smaller horizontal split" })
vim.keymap.set("n", "<A-Up>", "<cmd>resize +4<cr>", { desc = "Bigger horizontal split" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -4<cr>", { desc = "Smaller vertical split" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +4<cr>", { desc = "Bigger vertical split" })

vim.keymap.del("n", "<A-j>") -- Removes normal mode mapping for Ctrl + j
vim.keymap.del("n", "<A-k>")
vim.keymap.del("n", "<A-l>")
vim.keymap.del("n", "<A-h>")
-- resize with vim movemenet
vim.keymap.set("n", "<c-j>", "<cmd>resize -4<cr>", { desc = "Smaller horizontal split" })
vim.keymap.set("n", "<C-k>", "<cmd>resize +4<cr>", { desc = "Bigger horizontal split" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize -4<cr>", { desc = "Smaller vertical split" })
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize +4<cr>", { desc = "Bigger vertical split" })
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize +4<cr>", { desc = "Bigger vertical split" })
vim.keymap.del("n", "<leader>e")
