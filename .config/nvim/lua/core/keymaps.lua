local keymap = vim.keymap

keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<D-s>", ":w<CR>", { desc = "Save with cmd-s" })
keymap.set("n", "<D-a>", "ggVG", { desc = "Select all with cmd-a" })

keymap.set("n", "<D-/>", "gcc", { desc = "Comment current selection", remap = true })
keymap.set("i", "<D-/>", "<Esc>gcci", { desc = "Comment current selection", remap = true })
keymap.set("v", "<D-/>", "gcgv", { desc = "Comment current selection", remap = true })
