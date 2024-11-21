return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = "base16",
				component_separators = "",
				section_separators = "",
			},
		})
	end,
}
