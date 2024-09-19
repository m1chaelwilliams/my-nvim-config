local M = {}

function M.cloc(args)
  local output = vim.fn.system("cloc " .. args.args)
  print(output)
end

function M.pick_random_colorscheme()
  local colorschemes = vim.fn.getcompletion('', 'color')
  local random_index = math.random(1, #colorschemes)
  vim.cmd("colorscheme " .. colorschemes[random_index])
end

function M.setup(_)
  vim.api.nvim_create_user_command(
    "Cloc",
    M.cloc,
    {
      nargs = 1,
    }
  )
  vim.api.nvim_create_user_command(
    "RandCol",
    M.pick_random_colorscheme,
    {}
  )
end

return M
