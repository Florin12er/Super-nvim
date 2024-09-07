local null_ls = require("null-ls")

-- Auto-format on save for specific file types
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua", "*.go", "*.js", "*.jsx", "*.ts", "*.tsx", "*.py", "*.java" },
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

-- Setup null-ls with formatting and diagnostic sources
null_ls.setup({
	sources = {
		-- Lua
		null_ls.builtins.formatting.stylua,
		-- Python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		-- C/C++
		null_ls.builtins.formatting.clang_format,
		-- Go
		null_ls.builtins.formatting.golines,
		-- JavaScript/TypeScript
		null_ls.builtins.formatting.prettierd,
		-- Shell
		null_ls.builtins.formatting.shfmt,
		-- Ruby
		null_ls.builtins.diagnostics.rubocop,
		null_ls.builtins.formatting.rubocop,
		null_ls.builtins.formatting.htmlbeautifier,
		-- C#
		null_ls.builtins.formatting.csharpier,
		-- Java
		null_ls.builtins.formatting.google_java_format,

		-- Php
		null_ls.builtins.formatting.blade_formatter,
		null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.pretty_php,
	},
})
