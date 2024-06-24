local keymap = vim.keymap

if not vim.g.vscode then
	keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" })
	keymap.set("n", "<leader>c", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file tree" })

	keymap.set("n", "<D-s>", ":w<CR>", { desc = "Save with cmd-s" })
	keymap.set("n", "<D-a>", "ggVG", { desc = "Select all with cmd-a" })
else
	local function action(name)
		local function do_action()
			require("vscode").action(name)
		end
		return do_action
	end

	keymap.set(
		"n",
		"<leader>e",
		action("workbench.files.action.showActiveFileInExplorer"),
		{ desc = "Toggle file explorer" }
	)
	keymap.set("n", "<leader>c", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file tree" })
end

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<D-/>", "gcc", { desc = "Comment current selection", remap = true })
keymap.set("i", "<D-/>", "<Esc>gcci", { desc = "Comment current selection", remap = true })
keymap.set("v", "<D-/>", "gcgv", { desc = "Comment current selection", remap = true })
