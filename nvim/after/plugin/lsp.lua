local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- ─── Capabilities ────────────────────────────────────────────────────────────

local capabilities = cmp_nvim_lsp.default_capabilities()

-- ─── Diagnostic signs ────────────────────────────────────────────────────────

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

-- ─── Server configs ───────────────────────────────────────────────────────────

-- Servers that need no extra config beyond capabilities
local simple_servers = { "eslint", "rust_analyzer", "tailwindcss" }

for _, name in ipairs(simple_servers) do
	vim.lsp.config(name, { capabilities = capabilities })
	vim.lsp.enable(name)
end

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = { typeCheckingMode = "off" },
		},
	},
})
vim.lsp.enable("pyright")

-- ─── Mason ────────────────────────────────────────────────────────────────────

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "eslint", "lua_ls", "rust_analyzer", "tailwindcss" },
})

-- ─── On attach ───────────────────────────────────────────────────────────────

-- Servers that should not provide formatting (use your formatter instead)
local no_format = { "tsserver", "ts_ls", "rust_analyzer", "clangd" }

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local bufnr = event.buf
		local opts = { buffer = bufnr, remap = false }

		-- Kill eslint (you're using a formatter instead)
		if client.name == "eslint" then
			vim.cmd.LspStop("eslint")
			return
		end

		-- Disable semantic tokens globally (your preference)
		client.server_capabilities.semanticTokensProvider = nil

		-- Disable formatting for specific servers
		for _, name in ipairs(no_format) do
			if client.name == name then
				client.server_capabilities.documentFormattingProvider = false
				break
			end
		end

		-- lsp_signature
		if client.server_capabilities.signatureHelpProvider then
			require("lsp_signature").on_attach({
				bind = true,
				handler_opts = { border = "rounded" },
				floating_window = true,
				floating_window_above_cur_line = true,
				hint_enable = true,
				hint_inline = function()
					return "eol"
				end,
				hint_prefix = " ",
				select_signature_key = nil,
				move_cursor_key = nil,
				toggle_key = "<C-h>",
				extra_trigger_chars = { "(", "," },
				hi_parameter = "LspSignatureActiveParameter",
				scroll_in_floating_window = true,
			}, bufnr)
		end

		-- Keymaps
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set({ "n", "i" }, "<C-j>", vim.lsp.buf.hover, opts)
		vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set({ "n", "i" }, "<C-l>", vim.lsp.buf.code_action, opts)
	end,
})

-- ─── Completion ──────────────────────────────────────────────────────────────

local bordered_window = cmp.config.window.bordered({
	border = "rounded",
	winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
})

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp", keyword_length = 3, group_index = 1 },
	}),
	window = {
		documentation = bordered_window,
		completion = bordered_window,
	},
})

-- ─── Floating window borders (global) ────────────────────────────────────────

local orig_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return orig_open_floating_preview(contents, syntax, opts, ...)
end

-- ─── Suppress noisy warnings ─────────────────────────────────────────────────

local _notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end
	_notify(msg, ...)
end

-- ─── Diagnostic float keymap ─────────────────────────────────────────────────

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, { focus = false })
end)

-- ─── TypeScript code actions ─────────────────────────────────────────────────

local function run_code_action(kind)
	vim.lsp.buf.code_action({
		context = { only = { kind }, diagnostics = {} },
		apply = true,
	})
end

vim.keymap.set("n", "<leader>ca", function()
	vim.lsp.buf.code_action({
		context = {
			only = {
				"source.addMissingImports.ts",
				"source.removeUnused.ts",
				"source.removeUnusedImports.ts",
				"source.sortImports.ts",
				"source.organizeImports.ts",
			},
			diagnostics = {},
		},
		apply = true,
	})
end, { desc = "Code actions" })

vim.keymap.set("n", "<leader>ai", function()
	local sequence = {
		"source.addMissingImports.ts",
		"source.sortImports.ts",
		"source.organizeImports.ts",
	}
	for i, kind in ipairs(sequence) do
		vim.defer_fn(function()
			run_code_action(kind)
		end, 200 * (i - 1))
	end
end, { desc = "Add imports → sort → organize" })
