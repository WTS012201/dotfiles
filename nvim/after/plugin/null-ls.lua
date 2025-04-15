local null_ls = require("null-ls") -- ✅ correct


local formatting = null_ls.builtins.formatting

local sources = {
  formatting.autopep8,
  formatting.stylua,
  formatting.clang_format,
  formatting.prettier.with({
    extra_args = { "--print-width", "100" },
  }),
  formatting.rustfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "none-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})
