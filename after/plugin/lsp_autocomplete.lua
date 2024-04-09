local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("cmp_nvim_lsp").on_attach
local lspconfig = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"cssls",
		"html",
		"emmet_ls",
		"emmet_language_server",
		"eslint",
		"kotlin_language_server",
		"gopls",
		"rust_analyzer",
		"tailwindcss",
		"htmx",
		"volar",
		"pylsp",
		"emmet_ls",
		"ltex",
		"ast_grep",
		"golangci_lint_ls",
		"cssmodules_ls",
		"clangd",
		"jdtls",
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.pylsp.setup({
	capabilities = capabilities,
	filetypes = { "python", "py", "pydantic" },
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
				},
			},
		},
	},
})

lspconfig.clangd.setup({
	capabilities = capabilities,
})
lspconfig.cssmodules_ls.setup({
	capabilities = capabilities,
})
lspconfig.golangci_lint_ls.setup({
	capabilities = capabilities,
})

lspconfig.ast_grep.setup({
	capabilities = capabilities,
})
--java
lspconfig.jdtls.setup({
	capabilities = capabilities,
	cmd = { "jdtls" },
	settings = {
		java = {
			signatureHelp = {
				enabled = true,
			},
		},
	},
})
require("java").setup({
	rename = {
		enable = true, -- enable the functionality for renaming java files
		nvimtree = true, -- enable nvimtree integration
		write_and_close = false, -- automatically write and close modified (previously unopened) files after refactoring a java file
	},
	snippets = {
		enable = true, -- enable the functionality for java snippets
	},
	root_markers = { -- markers for detecting the package path (the package path should start *after* the marker)
		"main/java/",
		"test/java/",
	},
})

lspconfig.ltex.setup({
	capabilities = capabilities,
	cmd = { "ltex-ls" },
	filetypes = { "tex", "plaintex", "bib", "bibtex", "markdown" },
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
})
lspconfig.cssls.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
})
lspconfig.kotlin_language_server.setup({
	capabilities = capabilities,
})
lspconfig.gopls.setup({
	capabilities = capabilities,
})
lspconfig.html.setup({
	capabilities = capabilities,
	filetypes = { "html", "htmldjango", "markdown" },
})
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { "html", "htmldjango", "markdown" },
})
lspconfig.emmet_language_server.setup({
	capabilities = capabilities,
	filetypes = { "html", "htmldjango", "markdown" },
})
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
		},
	},
})
lspconfig.volar.setup({
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
})
lspconfig.htmx.setup({
	capabilities = capabilities,
})
require("luasnip.loaders.from_vscode").lazy_load()
