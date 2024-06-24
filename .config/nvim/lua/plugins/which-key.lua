return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 200
	end,

	opts = {
		--- default config
	},
	cond = not vim.g.vscode,
}
