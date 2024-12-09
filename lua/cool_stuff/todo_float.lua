local utils = require("utils")

local M = {}

local function float_win_config()
	local width = math.min(math.floor(vim.o.columns * 0.8), 64)
	local height = math.floor(vim.o.lines * 0.8)

	return {
		relative = "editor",
		width = width,
		height = height,
		col = utils.center_in(vim.o.columns, width),
		row = utils.center_in(vim.o.lines, height),
		border = "single",
	}
end

local function open_floating_file(filepath)
	local path = utils.expand_path(filepath)

	-- Check if the file exists
	if vim.fn.filereadable(path) == 0 then
		vim.notify("File does not exist: " .. path, vim.log.levels.ERROR)
		return
	end

	-- Look for an existing buffer with this file
	local buf = vim.fn.bufnr(path, true)

	-- If the buffer doesn't exist, create one and edit the file
	if buf == -1 then
		buf = vim.api.nvim_create_buf(false, false)
		vim.api.nvim_buf_set_name(buf, path)
		vim.api.nvim_buf_call(buf, function()
			vim.cmd("edit " .. vim.fn.fnameescape(path))
		end)
	end

	local win = vim.api.nvim_open_win(buf, true, float_win_config())

	vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
		noremap = true,
		silent = true,
		callback = function()
			-- Check if the buffer has unsaved changes
			if vim.api.nvim_get_option_value("modified", { buf = buf }) then
				vim.notify("save your changes bro", vim.log.levels.WARN)
			else
				vim.api.nvim_win_close(0, true)
			end
		end,
	})

	vim.api.nvim_create_autocmd("VimResized", {
		callback = function()
			vim.api.nvim_win_set_config(win, float_win_config())
		end,
		once = false,
	})
end

local function setup_user_commands()
	vim.api.nvim_create_user_command("Td", function()
		local path = "~/notes/todo.md"
		open_floating_file(path)
	end, {})
end

local function setup_keymaps()
	vim.keymap.set("n", "<leader>td", ":Td<CR>", {})
end

M.setup = function()
	setup_user_commands()
	setup_keymaps()
end

return M
