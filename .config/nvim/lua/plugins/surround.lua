local event

if not vim.g.vscode then
	event = { "BufReadPre", "BufNewFile" }
else
	event = { "VeryLazy" }
end

return {
	"kylechui/nvim-surround",
	event = event,
	version = "*",
	config = true,
}
