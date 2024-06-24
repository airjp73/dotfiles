return {
	"folke/tokyonight.nvim",
	priority = 1000,
	cond = not vim.g.vscode,
	config = function()
		vim.cmd("colorscheme tokyonight")
	end,
}
