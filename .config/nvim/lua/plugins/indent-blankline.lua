return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cond = not vim.g.vscode,
	main = "ibl",
	opts = {
		indent = { char = "|" },
	},
}
