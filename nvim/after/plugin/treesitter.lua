vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#FFD700" })    -- gold
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#A3719F" }) -- purple
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#179FFF" })   -- blue
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#FFD700" }) -- repeat gold
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#A3719F" })  -- repeat purple
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#179FFF" }) -- repeat blue
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#FFD700" })   -- repeat gold again


-- Your existing nvim-treesitter configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "c",
    "lua",
    "rust",
    "cpp",
    "python",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    query = {
      "rainbow-parens",
      tsx = "tsx-highlights",
      typescript = "ts-highlights",
      rust = "rs-highlights",
      c = "c-highlights",
      cpp = "cpp-highlights",
    },
  },
})

require("nvim-ts-autotag").setup()
