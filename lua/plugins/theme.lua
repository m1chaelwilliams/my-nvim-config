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
return {
	"vague2k/vague.nvim",
	config = function()
		require("vague").setup({
			-- optional configuration here
		})

		vim.cmd("colorscheme vague")
	end,
}
