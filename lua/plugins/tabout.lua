return {
	"abecodes/tabout.nvim",
	lazy = false,
	config = function()
		require("tabout").setup({
			tabkey = "<Tab>"
		})
	end
}
