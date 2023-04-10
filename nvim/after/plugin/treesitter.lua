require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust", "cpp", "python" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	highlight = {
		-- `false` will disable the whole extension
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {}, -- table of hex strings
	},
	autopairs = {
		enable = true,
	},
})

vim.api.nvim_create_augroup("rainbow", {
	clear = true,
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "rainbowcol1", {
			fg = "#FFD700",
		})
		vim.api.nvim_set_hl(0, "rainbowcol2", {
			fg = "#A3719F",
		})
		vim.api.nvim_set_hl(0, "rainbowcol3", {
			fg = "#179FFF",
		})
		vim.api.nvim_set_hl(0, "rainbowcol4", {
			fg = "#FFD700",
		})
		vim.api.nvim_set_hl(0, "rainbowcol5", {
			fg = "#A3719F",
		})
		vim.api.nvim_set_hl(0, "rainbowcol6", {
			fg = "#179FFF",
		})
		vim.api.nvim_set_hl(0, "rainbowcol7", {
			fg = "#A3719F",
		})
	end,
	group = "rainbow",
})
