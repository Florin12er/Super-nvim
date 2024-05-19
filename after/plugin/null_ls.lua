local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.gdformat,
        null_ls.builtins.diagnostics.gdlint,
	},
})
