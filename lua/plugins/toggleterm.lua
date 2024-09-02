return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({})
    vim.keymap.set("n", "<leader>m", ":ToggleTerm<CR>")
  end,
}
