-- Hi Michael !

-- entry point of nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {}

-- vim opts
require("vimopts")
-- lazy.nvim setup
require("lazy").setup("plugins")

-- treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "go", "rust", "c", "lua", "python", "html", "css", "javascript", "templ", "prisma" },
  highlight = { enable = true },
  indent = { enable = true },
})

vim.filetype.add({ extension = { templ = "templ" } })
