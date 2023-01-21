require("nvim_comment").setup({ create_mappings = false })
vim.keymap.set({ "n", "i" }, "<C-/>", "<CMD>:CommentToggle<CR>")
vim.keymap.set("v", "<C-/>", ":CommentToggle<CR>")
