vim.api.nvim_create_augroup("rust_mappings", { clear = true })

-- insert || because that can be annoying to type
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	group = "rust_mappings",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>b", "a||<Esc>i", { noremap = true, silent = true })
	end,
})
