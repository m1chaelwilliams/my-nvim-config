local M = {}

function M.cloc(args)
  local command = "ls " .. args.args
  print("running command: " .. command)
  local output = vim.fn.system(command)
  print(output)
end

function M.setup(_opts)
  vim.api.nvim_create_user_command("Cloc", M.cloc, {
    nargs = 1,
    complete = 'shellcmd',
  })
end

return M
