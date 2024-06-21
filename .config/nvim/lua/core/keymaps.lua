vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", " ", "<leader")
keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
