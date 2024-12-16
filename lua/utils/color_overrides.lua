local M = {}

-- sets the line colors for vague
function M.vague_line_colors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#646477" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#646477" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })
end

function M.my_line_colors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })
end

function M.black_metal_theme_overrides()
	vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })
	vim.api.nvim_set_hl(0, "TSComment", { fg = "#555555", gui = nil })
	vim.api.nvim_set_hl(0, "Visual", { bg = "#9b8d7f", fg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "Search", { bg = "#9b8d7f", fg = "#1e1e1e" })

	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888", bg = "#1e1e1e" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })
end

function M.vague_status_colors()
	local custom_iceberk_dark = require("lualine.themes.iceberg_dark")
	-- custom_iceberk_dark.normal.c.bg = "#080808" -- archiving bc this is my term bg
	custom_iceberk_dark.normal.c.bg = nil
	custom_iceberk_dark.inactive.b.bg = nil
	custom_iceberk_dark.inactive.a.bg = nil
	custom_iceberk_dark.inactive.c.bg = nil
	custom_iceberk_dark.insert.a.bg = "#bc96b0"
	custom_iceberk_dark.visual.a.bg = "#787bab"
	custom_iceberk_dark.replace.a.bg = "#a1b3b9"

	require("lualine").setup({
		options = {
			theme = custom_iceberk_dark,
		},
	})
end

-- sets up custom colors dependent on themes
function M.setup_colorscheme_overrides()
	vim.api.nvim_create_autocmd("ColorScheme", {
		-- so it's fired when used in other autocmds
		nested = true,
		pattern = "*",
		callback = function()
			local colorscheme = vim.g.colors_name
			if string.find(colorscheme, "base16") then
				if string.find(colorscheme, "metal") then
					M.black_metal_theme_overrides()
				end
				M.my_line_colors()
				-- vim.defer_fn(function()
				-- 	vim.cmd("TransparentEnable")
				-- end, 10)
			elseif colorscheme == "zenburn" then
				M.my_line_colors()
				-- vim.defer_fn(function()
				-- 	vim.cmd("TransparentDisable")
				-- end, 10)
			elseif colorscheme == "vague" then
				M.vague_line_colors()
				M.vague_status_colors()
			end
		end,
	})
end

-- setup some commands for manually setting values
vim.api.nvim_create_user_command("MyLine", M.my_line_colors, {})
vim.api.nvim_create_user_command("VagueStatus", M.vague_status_colors, {})
vim.api.nvim_create_user_command("VagueLine", M.vague_line_colors, {})
vim.api.nvim_create_user_command("DefStatus", function()
	require("lualine").setup({ options = { theme = "auto" } })
end, {})

return M
