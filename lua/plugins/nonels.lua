return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			autostart = true,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier.with({
					-- filetypes = { "typescriptreact", "javascriptreact", "json" },
					-- filetypes = { "json" },
				}),
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.yamlfmt,
				-- null_ls.builtins.formatting.ormolu,
			},
			on_attach = function(client, buffer)
				-- if client.name == "tsserver" then
				-- 	client.server_capabilities.documentFormattingProvider = false
				-- 	client.server_capabilities.documentRangeFormattingProvider = false
				-- end
				-- client.server_capabilities.documentFormattingProvider = false
				-- client.server_capabilities.documentRangeFormattingProvider = false
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = buffer,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = buffer,
						callback = function()
							vim.lsp.buf.format({ bufnr = buffer })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
