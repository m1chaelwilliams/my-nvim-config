local autopairsconfig = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		npairs.setup({})
	end,
	opts = {},
}

return autopairsconfig
