return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			-- color_icons = false,
			override = {
				folder_closed = {
					icon = "",
					color = "#ff69b4", -- Hex code for pink
					cterm_color = "205",
					name = "Folder",
				},
				folder_open = {
					icon = "",
					color = "#ff69b4",
					cterm_color = "205",
					name = "FolderOpen",
				},
			},
		})
	end,
	priority = 1000,
}
