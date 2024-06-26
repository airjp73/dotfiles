return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	cond = not vim.g.vscode,
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "→",
							arrow_open = "↓",
						},
					},
				},

				-- These just seem to generate an error on startup, so not sure what to do with them
				-- disable window_picker for explorer to wrok well with window splits
				-- actions = {
				-- 	open_file = {
				-- 		window_picker = {
				-- 			enable = false,
				-- 		},
				-- 	},
				-- },
				-- filters = {
				--   custom = { ".DS_Store" },
				-- },
				-- git = {
				--   ignore = false,
				-- }
			},
		})
	end,
}
