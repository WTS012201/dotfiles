local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>")
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<Tab>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Esc>"] = cmp.mapping.close(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	--- Guard against servers without the signatureHelper capability
	if client.server_capabilities.signatureHelpProvider then
		require("lsp-overloads").setup(client, {})
	end

	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	elseif client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	elseif client.name == "clangd" then
		client.server_capabilities.documentFormattingProvider = false
	end

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set({ "n", "i" }, "<C-j>", vim.lsp.buf.hover, opts)
	vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set({ "n", "i" }, "<C-l>", vim.lsp.buf.code_action, opts)
end)

lsp.configure("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end
