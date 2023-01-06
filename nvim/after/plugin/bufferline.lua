local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

require("bufferline").setup({
	options = {
		show_tab_indicators = false,
		max_name_length = 30,
		max_prefix_length = 30,
		tab_size = 20,
		indicator = {
			style = "▎",
		},
		show_close_icon = false,
		show_buffer_close_icons = false,
		separator_style = "thick",
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
	},
})

vim.keymap.set("n", "<S-l>", ":bnext<cr>")
vim.keymap.set("n", "<S-h>", ":bprev<cr>")
-- vim.keymap.set("n", "<S-q>", ":bdelete<cr>")
vim.keymap.set("n", "<S-q>", ":bp<bar>sp<bar>bn<bar>bd<CR>")
