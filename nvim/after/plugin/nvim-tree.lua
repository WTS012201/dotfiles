-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Function to set key mappings for nvim-tree
local function on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings.
	api.config.mappings.default_on_attach(bufnr)

	-- Custom mappings
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "<C-t>", api.tree.close, opts("Close"))
	vim.keymap.set("n", "<C-c>", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "<C-v>", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "<C-x>", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "<C-d>", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "<C-r>", api.fs.rename, opts("Rename"))
end

-- Setup nvim-tree with updated options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		number = true,
		relativenumber = true,
	},
	renderer = {
		group_empty = true,
		symlink_destination = false,
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = { enable = false },
		},
	},
	on_attach = on_attach,
})

-- Start nvim-tree with a keymap
vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<cr>")
