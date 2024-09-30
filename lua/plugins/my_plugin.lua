return {
	-- dir = "C:/Users/micha/AppData/local/nvim/lua/plugins/my_plugin",
	-- name = "my_plugin",
	"m1chaelwilliams/ezdiagnostics",
	config = function()
		require("ezdiagnostics").setup({
			cmd = "<leader>ld",
		})
	end,
}
