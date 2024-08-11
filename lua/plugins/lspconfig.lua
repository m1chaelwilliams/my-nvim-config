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
			local capabilties = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilties = capabilties,
			})
			lspconfig.rust_analyzer.setup({
				capabilties = capabilties,
			})
			lspconfig.gopls.setup({
				capabilties = capabilties,
			})
			lspconfig.html.setup({
				capabilties = capabilties,
				filetypes = { "html", "templ" },
			})
			lspconfig.htmx.setup({
				capabilties = capabilties,
				filetypes = { "html", "templ" },
			})
			lspconfig.emmet_language_server.setup({
				capabilties = capabilties,
				filetypes = { "html", "templ", "jsx", "tsx" },
			})
			lspconfig.tailwindcss.setup({
				capabilties = capabilties,
				filetypes = { "html", "templ", "tsx", "jsx" },
			})
			lspconfig.templ.setup({
				capabilties = capabilties,
				filetypes = { "templ" },
			})
			lspconfig.tsserver.setup({
				capabilties = capabilties,
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
				capabilties = capabilties,
				settings = {
					python = {
						pythonPath = get_python_path(),
					},
				},
			})
		end,
	},
}
