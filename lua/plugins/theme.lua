-- kanagawa theme
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	name = "kanagawa",
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			keywordStyle = { italic = false },
-- 			colors = {
-- 				theme = {
-- 					all = {
-- 						ui = {
-- 							bg_gutter = "none",
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
--
-- 		-- set the colorscheme
-- 		vim.cmd("colorscheme kanagawa-dragon")
-- 	end,
-- }
--
-- Lazy
-- return {
-- 	"embark-theme/vim",
-- 	config = function()
-- 		vim.cmd("colorscheme embark")
-- 	end,
-- }
--

return {
	"vague2k/vague.nvim",
	config = function()
		require("vague").setup({
			-- optional configuration here
			transparent = true,
			style = {
				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
				boolean = "none",
				number = "none",
				float = "none",
				error = "none",
				comments = "none",
				conditionals = "none",
				functions = "none",
				headings = "bold",
				operators = "none",
				strings = "none",
				variables = "none",

				-- keywords
				keywords = "none",
				keyword_return = "none",
				keywords_loop = "none",
				keywords_label = "none",
				keywords_exception = "none",

				-- builtin
				builtin_constants = "none",
				builtin_functions = "none",
				builtin_types = "none",
				builtin_variables = "none",
			},
			colors = {
				func = "#bc96b0",
				keyword = "#787bab",
				string = "#d4bd98",
				-- string = "#d8d5b1",
				fg = "#d6d2c8",
				-- type = "#dcaed7",
			},
		})

		vim.cmd("colorscheme vague")
	end,
}
