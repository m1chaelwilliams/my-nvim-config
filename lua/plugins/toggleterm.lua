return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({})
    vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")
  end,
}
