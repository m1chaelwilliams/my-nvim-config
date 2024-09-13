-- general settings
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set ts=2")
vim.cmd("set cmdheight=0")
vim.cmd("set termguicolors")

vim.cmd("set shell=bash")
vim.cmd("set shellcmdflag=-command")
vim.cmd('set shellquote="')
vim.cmd("set shellxquote=")

-- stop right-shift when errors/warning appear
vim.o.signcolumn = "yes"
vim.o.completeopt = "menuone,noselect,preview"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- move selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up

-- remaps
vim.g.mapleader = " "

-- zig
-- vim.g.zig_fmt_autosave = 0

-- neo-tree setup
-- vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal right<CR>")

-- oil.nvim setup
vim.keymap.set("n", "<leader>N", ":Oil<CR>")
vim.keymap.set("n", "<leader>n", ':lua require("oil").toggle_float()<CR>')
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "Y", "yy")

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

function leave_snippet()
	if
		((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
		and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
		and not require("luasnip").session.jump_active
	then
		require("luasnip").unlink_current()
	end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])
