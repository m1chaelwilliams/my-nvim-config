return {
  dir = "~/.config/nvim/lua/plugins/my_plugin",
  name = "my_plugin",
  config = function()
    require("my_plugin").setup({})
  end
}
