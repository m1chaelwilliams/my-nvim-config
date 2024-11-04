return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app; yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_browser = "/Applications/Brave Browser.app"
	end,
	ft = { "markdown" },
	config = function()
		vim.keymap.set("n", "<leader>mdn", ":MarkdownPreview<CR>")
		vim.keymap.set("n", "<leader>mds", ":MarkdownPreviewStop<CR>")

		vim.g.mkdp_markdown_css = "$XDG_HOME/.config/nvim/assets/md.css"
		vim.g.mkdp_highlight_css = "$XDG_HOME/.config/nvim/assets/mdhl.css"
	end,
}
