local null_ls = require("null-ls")
-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua", "*.go", "*.js", "*.jsx", "*.ts", "*.tsx", "*.rb", "*.py", "*.java" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.golines,
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.formatting.eslint_d"),
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.google_java_format,
    },
})
