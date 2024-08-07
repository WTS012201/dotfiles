local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 1,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local float_term = Terminal:new({
	direction = "float",
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"n",
			"<m-1>",
			"<cmd>1ToggleTerm direction=float<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"t",
			"<m-1>",
			"<cmd>1ToggleTerm direction=float<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"i",
			"<m-1>",
			"<cmd>1ToggleTerm direction=float<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-2>", "<nop>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-3>", "<nop>", { noremap = true, silent = true })
	end,
	count = 1,
})

function _FLOAT_TERM()
	float_term:toggle()
end

vim.api.nvim_set_keymap("n", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-1>", "<cmd>lua _FLOAT_TERM()<CR>", { noremap = true, silent = true })

local vertical_term = Terminal:new({
	direction = "vertical",
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"n",
			"<m-2>",
			"<cmd>2ToggleTerm size=60 direction=vertical<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"t",
			"<m-2>",
			"<cmd>2ToggleTerm size=60 direction=vertical<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"i",
			"<m-2>",
			"<cmd>2ToggleTerm size=60 direction=vertical<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-3>", "<nop>", { noremap = true, silent = true })
	end,
	count = 2,
})

function _VERTICAL_TERM()
	vertical_term:toggle(60)
end

vim.api.nvim_set_keymap("n", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-2>", "<cmd>lua _VERTICAL_TERM()<CR>", { noremap = true, silent = true })

local horizontal_term = Terminal:new({
	direction = "horizontal",
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"n",
			"<m-3>",
			"<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"t",
			"<m-3>",
			"<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			term.bufnr,
			"i",
			"<m-3>",
			"<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-2>", "<nop>", { noremap = true, silent = true })
	end,
	count = 3,
})

function _HORIZONTAL_TERM()
	horizontal_term:toggle(10)
end

vim.api.nvim_set_keymap("n", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-3>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
