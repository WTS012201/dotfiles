-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
				{ key = "<C-t>", action = "close" },
				{ key = "<C-c>", action = "copy" },
				{ key = "<C-v>", action = "paste" },
				{ key = "<C-x>", action = "cut" },
				{ key = "<C-d>", action = "remove" },
				{ key = "<C-r>", action = "rename" },
			},
		},
		hide_root_folder = true,
		number = true,
		relativenumber = true,
	},
	renderer = {
		group_empty = true,
		symlink_destination = false,
	},
	filters = {
		dotfiles = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = { enable = false },
		},
	},
})

-- start nvim-tree
vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<cr>")
