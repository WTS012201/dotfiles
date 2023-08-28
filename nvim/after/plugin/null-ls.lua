local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.autopep8,
	formatting.stylua,
	formatting.clang_format,
	formatting.prettier,
	formatting.rustfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end

		if client.name == "rustfmt" then
		end
	end,
})
