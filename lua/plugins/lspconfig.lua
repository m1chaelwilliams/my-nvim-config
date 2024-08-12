return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"gopls",
					"templ",
					"html",
					"cssls",
					"emmet_language_server",
					"htmx",
					"tailwindcss",
					"tsserver",
					"pylsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"templ",
					"html",
					"css",
					"javascriptreact",
					"typescriptreact",
					"javascript",
					"typescript",
					"jsx",
					"tsx",
				},
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
				filetypes = { "templ" },
			})
			lspconfig.tsserver.setup({
				capabilties = capabilities,
				-- filetypes = { "js", "jsx", "ts", "tsx" },
			})

			function get_python_path()
				-- Check if there's an active virtual environment
				local venv_path = os.getenv("VIRTUAL_ENV")
				if venv_path then
					return venv_path .. "/bin/python"
				else
					-- Fallback to global Python interpreter
					return "C:/Python312" -- Or the path to your global Python interpreter
				end
			end

			lspconfig.pylsp.setup({
				capabilties = capabilities,
				settings = {
					python = {
						pythonPath = get_python_path(),
					},
				},
			})
		end,
	},
}
