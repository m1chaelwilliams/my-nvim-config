return {
	"folke/zen-mode.nvim",
	opts = {},
	config = function()
		require("zen-mode").setup({
			window = {
				width = 83,
			},
		})
		vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>")
	end,
}
