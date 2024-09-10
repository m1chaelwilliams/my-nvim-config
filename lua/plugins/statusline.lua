return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local custom_iceberk_dark = require("lualine.themes.iceberg_dark")
		-- custom_iceberk_dark.normal.c.bg = "#080808" -- archiving bc this is my term bg
		custom_iceberk_dark.normal.c.bg = nil
		custom_iceberk_dark.inactive.b.bg = nil
		custom_iceberk_dark.inactive.a.bg = nil
		custom_iceberk_dark.inactive.c.bg = nil
		custom_iceberk_dark.insert.a.bg = "#bc96b0"
		custom_iceberk_dark.visual.a.bg = "#787bab"
		custom_iceberk_dark.replace.a.bg = "#a1b3b9"

		require("lualine").setup({
			options = {
				-- theme = "seoul256"
				theme = custom_iceberk_dark,
			},
		})
	end,
}
