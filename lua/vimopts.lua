-- general settings
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set ts=2")

-- stop right-shift when errors/warning appear
vim.o.signcolumn = "yes"
vim.o.completeopt = "menuone,noselect"

-- remaps
vim.g.mapleader = " "

-- neo-tree setup
vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal right<CR>")

-- lsp setup
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- see error
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- disable default errors
vim.diagnostic.config({
	virtual_text = false,
})
