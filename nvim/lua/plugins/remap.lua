vim.g.mapleader = " "

function getFileName()
	local filename = vim.fn.expand("%:t:r")
	return filename
end

function insertTsxPattern()
	local fileName = getFileName()
	local pattern = {
		"interface " .. fileName .. "Props{}", -- Line 1
		"", -- Empty line
		"export const " .. fileName .. ": React.FC<" .. fileName .. "Props> = ({}) => {", -- Line 3
		"  return <div></div>", -- Line 4
		"}", -- Line 5
	}

	-- Insert the pattern into the current buffer
	vim.api.nvim_put(pattern, "l", true, true)

	-- Save and format the document by simulating <C-s> keybinding
	vim.cmd(":w")
	vim.cmd(":e")
end

local function go_to_definition_in_split()
	local win_count = vim.fn.winnr("$")
	local win_position = vim.fn.winnr()

	local has_vertical_split = win_count > 1
	vim.notify("Has vertical split: " .. tostring(has_vertical_split))

	if not has_vertical_split then
		vim.cmd("vsplit")
		vim.notify("Created a new vertical split")
	end

	vim.lsp.buf.definition()

	if win_position == 1 then
		vim.cmd("wincmd l")
	else
		vim.cmd("wincmd h")
	end
end

vim.keymap.set("n", "<leader>h", go_to_definition_in_split, { noremap = true, silent = true })

-- Set the keybinding for the new function
vim.api.nvim_set_keymap("n", "<leader>tsx", ":lua insertTsxPattern()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- highlight move and autoindent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor remain in place
vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor remain in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- highlight replace without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy text into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- no cap q
vim.keymap.set("n", "Q", "<nop>")

-- change all occurences
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- save
vim.keymap.set({ "n", "i" }, "<C-s>", "<CMD>:w<CR><CMD>:e<CR>")

-- tab & shift tab
vim.keymap.set({ "n", "i" }, "<s-tab>", "<cmd><<cr>")
vim.keymap.set("n", "<tab>", "<cmd>><cr>")
vim.keymap.set("v", "<tab>", ">")
vim.keymap.set("v", "<S-Tab>", "<")

-- window
vim.keymap.set("n", "<M-v>", ":vsplit <cr>")
vim.keymap.set("n", "<M-q>", ":q <cr>")
vim.keymap.set("n", "<M-l>", ":wincmd l<cr>")
vim.keymap.set("n", "<M-h>", ":wincmd h<cr>")
