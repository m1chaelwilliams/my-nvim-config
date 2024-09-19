-- telescope.nvim
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
          find_files = {
            hidden = true,
            find_command = {
              "rg",
              "--files",
              "--glob",
              "!{.git/*,.next/*,.svelte-kit/*,target/*,node_modules/*}",
              "--path-separator",
              "/",
            },
          },
        },
      })
      -- telescope setup
      local builtin = require("telescope.builtin")
      -- vim.keymap.set("n", "<C-p>", builtin.find_files, {})

      vim.keymap.set(
        "n",
        "<C-p>",
        "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
        {}
      )
      vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<cr>", {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end,
  },
}
