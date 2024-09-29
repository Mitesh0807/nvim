local M = {}

-- sets the line colors for vague
function M.vague_line_colors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#646477" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#646477" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })
end

function M.catppuccin_status_colors()
	local colors = require("catppuccin.palettes").get_palette()
	local custom_catppuccin = require("lualine.themes.catppuccin")

	custom_catppuccin.normal.c.bg = "NONE"
	custom_catppuccin.inactive.b.bg = "NONE"
	custom_catppuccin.inactive.a.bg = "NONE"
	custom_catppuccin.inactive.c.bg = "NONE"
	custom_catppuccin.insert.a.bg = colors.pink
	custom_catppuccin.visual.a.bg = colors.mauve
	custom_catppuccin.replace.a.bg = colors.red

	require("lualine").setup({
		options = {
			theme = custom_catppuccin,
		},
	})
end

return M
