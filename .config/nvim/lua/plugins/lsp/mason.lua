return {
	{
		"williamboman/mason.nvim",
		cond = not vim.g.vscode,
		config = function()
			-- import mason
			local mason = require("mason")
			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cond = not vim.g.vscode,
		requires = {
			"williambowman/mason.nvim",
		},
		config = function()
			-- import mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = {
					"astro",
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"graphql",
					"emmet_ls",
					"prismals",
					"pyright",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cond = not vim.g.vscode,
		requires = {
			"williambowman/mason.nvim",
		},
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"eslint",
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint",
					"eslint_d",
				},
			})
		end,
	},
}
