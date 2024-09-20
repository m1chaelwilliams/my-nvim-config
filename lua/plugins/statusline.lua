return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("lualine").setup({
			options = {
				-- theme = "seoul256"
				theme = "auto",
			},
		})
	end,
}
