local utils = require("utils")

-- lazy
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
require("lazy").setup("plugins", {
	defaults = {
		lazy = false,
	},
})

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
		"prisma",
		"haskell",
		"zig",
		"gleam",
		"wgsl",
		"php",
		"nim",
	},
	highlight = { enable = true, disable = { "sql" } },
	indent = { enable = true },
})

-- language specific mappings go here
require("mappings")

utils.color_overrides.setup_colorscheme_overrides()

-- theme
vim.cmd("colorscheme base16-black-metal-gorgoroth")

utils.fix_telescope_parens_win()
utils.dashboard.setup_dashboard_image_colors()
