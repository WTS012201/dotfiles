local rainbow = require("ts-rainbow")

vim.api.nvim_set_hl(0, "TSRainbow1", {
	fg = "#FFD700",
})
vim.api.nvim_set_hl(0, "TSRainbow2", {
	fg = "#A3719F",
})
vim.api.nvim_set_hl(0, "TSRainbow3", {
	fg = "#179FFF",
})

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
		strategy = require("ts-rainbow").strategy.global,
		hlgroups = {
			"TSRainbow1",
			"TSRainbow2",
			"TSRainbow3",
		},
	},
})

require("nvim-ts-autotag").setup()
