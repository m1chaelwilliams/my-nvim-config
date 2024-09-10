-- Hi Michael !

-- entry point of nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- vim opts
require("vimopts")
-- lazy.nvim setup
require("lazy").setup("plugins")

-- treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {
		"go",
		"rust",
		"c",
		"lua",
		"python",
		"html",
		"css",
		"javascript",
		"typescript",
		"templ",
		"prisma",
		"haskell",
		"zig",
		"latex",
		"gleam",
		"sql",
	},
	highlight = { enable = true },
	indent = { enable = true },
})

vim.filetype.add({ extension = { templ = "templ" } })

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#646477" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#646477" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })

vim.api.nvim_create_augroup("rust_mappings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	group = "rust_mappings",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>b", "a||<Esc>i", { noremap = true, silent = true })
	end,
})
