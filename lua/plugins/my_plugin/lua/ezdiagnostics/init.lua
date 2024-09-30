local M = {}

function M.open_diagnostics_buffer(config)
	local diagnostics = vim.diagnostic.get(0)
	local buf = vim.api.nvim_create_buf(false, true) -- false for listed, true for scratch buffer

	-- Set buffer options
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "bufhidden", "hide")
	vim.api.nvim_buf_set_option(buf, "swapfile", false)

	-- Prepare lines to display
	local lines = {}
	if #diagnostics == 0 then
		table.insert(lines, "No diagnostics found.")
	else
		for _, diag in ipairs(diagnostics) do
			local line = diag.lnum + 1 -- line number (0-based to 1-based)
			local col = diag.col + 1 -- column number (0-based to 1-based)
			local message = diag.message -- diagnostic message
			local severity = vim.diagnostic.severity[diag.severity]

			table.insert(lines, string.format("[%s] Line %d, Col %d: %s", severity, line, col, message))
		end
	end

	-- Set lines in the buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	-- set to immutable after adding lines
	vim.api.nvim_buf_set_option(buf, "modifiable", false) -- Make buffer immutable

	local margin = config.margin -- Change this value to adjust the margin size
	local win_width = config.width
	local win_height = math.max(1, #diagnostics)

	-- get the x and y for centering the window
	local col = math.floor((vim.o.columns - win_width - margin * 2) / 2) + margin
	local row = math.floor((vim.o.lines - win_height - margin * 2) / 2) + margin

	-- Create a new window for the buffer
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = win_width,
		height = win_height,
		col = col,
		row = row,
		border = "single",
	})

	-- shortcuts
	vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	-- Function to jump to the diagnostic line
	local function jump_to_diagnostic(line_number)
		local line_index = line_number
		if diagnostics[line_index] then
			local diagnostic = diagnostics[line_index]
			vim.cmd("close")
			vim.api.nvim_set_current_buf(0)
			vim.api.nvim_win_set_cursor(0, { diagnostic.lnum + 1, diagnostic.col }) -- Go to line and column (1-based)
			vim.cmd("normal! zz") -- Center the cursor line vertically
		end
	end

	-- Set key mapping for Enter to jump to the diagnostic line
	vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", "", {
		noremap = true,
		silent = true,
		callback = function()
			local current_line = vim.api.nvim_win_get_cursor(win)[1] -- Get the current line in the diagnostics buffer
			jump_to_diagnostic(current_line) -- Jump to the corresponding diagnostic
		end,
	})
end

function M.setup(config)
	config = config or {}
	config.cmd = config.cmd or "<leader>ld"
	config.margin = config.margin or 2
	config.width = config.width or 60

	vim.api.nvim_create_user_command("AllDiag", function()
		M.open_diagnostics_buffer(config)
	end, {})
	vim.keymap.set("n", config.cmd, ":AllDiag<CR>")
end

return M
