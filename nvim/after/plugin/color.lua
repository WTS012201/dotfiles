-- For dark theme (neovim's default)

vim.o.background = "dark"

local c = require("vscode.colors").get_colors()
require("vscode").setup({
  transparent = true,
  italic_comments = true,
  disable_nvimtree_bg = true,
  color_overrides = {
    vscLineNumber = "#FFFFFF",
  },
  group_overrides = {
    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
  },
  terminal_colors = false,
})

function ColorMyPencils(color)
  require("vscode").load()
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
  vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = "none" })
  vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { fg = "#FFD700" })
  -- repeat for any filetypes you use often


  -- Diagnostics
  vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#f44747", bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#dcdcaa", bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#569cd6", bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#569cd6", bg = "none" })

  -- Other
  vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#d7ba7d", bg = "none" })
  vim.api.nvim_set_hl(0, "@keyword.coroutine", { fg = "#c586c0", bg = "none" })
  vim.api.nvim_set_hl(0, "@constructor.typescript", { fg = "#4ec9b0", bg = "none" })
end

local group = vim.api.nvim_create_augroup("Colors", {})
vim.api.nvim_create_autocmd("ColorScheme", { callback = ColorMyPencils, group = group })

ColorMyPencils()
