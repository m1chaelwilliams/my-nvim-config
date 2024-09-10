return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	config = function()
		require("render-markdown").setup({})
	end,
	-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you prefer nvim-web-devicons
}
