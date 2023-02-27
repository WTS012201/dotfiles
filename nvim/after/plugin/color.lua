-- For dark theme (neovim's default)
vim.o.background = "dark"

local c = require("vscode.colors")
require("vscode").setup({
	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = "#FFFFFF",
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	},
})

function ColorMyPencils(color)
	color = color or "vscode"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#AAAAAA" })
	-- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#179FFf" })
	-- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#9CDCFE" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#FFD700" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1e1e1e" })

	-- gui
	vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { ctermbg = "none" })
	vim.api.nvim_set_hl(0, "Folded", { ctermbg = "none" })
	vim.api.nvim_set_hl(0, "NonText", { ctermbg = "none" })
	vim.api.nvim_set_hl(0, "SpecialKey", { ctermbg = "none" })
	vim.api.nvim_set_hl(0, "VertSplit", { ctermbg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermbg = "none" })

	-- Transparent
	-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#1e1e1e" })
	-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })

	-- Nvim
	vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none" })

	-- Bufferline
	vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = "#179FFf" })
	vim.api.nvim_set_hl(0, "BufferLineCloseButton", { fg = "#AAAAAA", bg = "#161616" })
	vim.api.nvim_set_hl(0, "BufferLineTabClose", { fg = "#AAAAAA" })
	vim.api.nvim_set_hl(0, "BufferLineTabClose", { fg = "#AAAAAA", bg = "#FFFFFF" })
	vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = "#AAAAAA", bg = "#161616" })
	vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#FFD700", bg = "#1e1e1e" })

	-- Diagnostics
	vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#f44747", bg = "none" })
	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#dcdcaa", bg = "none" })
	vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#569cd6", bg = "none" })
	vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#569cd6", bg = "none" })
	-- vim.api.nvim_set_hl(0, "@operator", { fg = "#569cd6" })
end

ColorMyPencils()
