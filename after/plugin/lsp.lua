-- Setup capabilities for LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup Mason and Mason-LSPConfig
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
		"golangci_lint_ls",
		"cssmodules_ls",
		"clangd",
		"prismals",
		"jdtls",
		"csharp_ls",
		"svelte",
		"templ",
		"ruby_ls",
	},
})

-- Add custom file types
vim.filetype.add({
	extension = {
		ejs = "ejs",
		templ = "templ",
	},
})

-- LSP Configurations
local lspconfig = require("lspconfig")

-- Lua
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

-- ruby
lspconfig.ruby_ls.setup({
	capabilities = capabilities,
})

-- JavaScript/TypeScript
lspconfig.tsserver.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
})
lspconfig.prismals.setup({ capabilities = capabilities })
lspconfig.svelte.setup({ capabilities = capabilities })
lspconfig.volar.setup({ capabilities = capabilities })

-- CSS
lspconfig.cssls.setup({
	capabilities = capabilities,
	filetypes = { "svelte", "css", "sass", "less", "javascriptreact" },
})
lspconfig.cssmodules_ls.setup({
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	filetypes = {
		"html",
		"sass",
		"ejs",
		"typescriptreact",
		"typescript",
		"javascriptreact",
		"templ",
		"astro",
		"javascript",
	},
	settings = {
		tailwindCSS = {
			includeLanguages = {
				templ = "html",
				ejs = "ejs",
			},
		},
	},
})

-- HTML and related
lspconfig.html.setup({
	capabilities = capabilities,
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
	filetypes = { "html", "htmldjango", "markdown", "templ" },
})
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { "html", "svelte", "htmldjango", "javascriptreact", "typescriptreact", "markdown", "ejs", "templ" },
})
lspconfig.emmet_language_server.setup({
	capabilities = capabilities,
	filetypes = { "html", "svelte", "htmldjango", "javascriptreact", "typescriptreact", "markdown", "ejs", "templ" },
})
lspconfig.htmx.setup({
	capabilities = capabilities,
	filetypes = { "html", "templ" },
})

-- Python
lspconfig.pylsp.setup({
	capabilities = capabilities,
	filetypes = { "python", "py", "pydantic" },
})

-- C/C++/c#
lspconfig.clangd.setup({
	capabilities = capabilities,
})
lspconfig.csharp_ls.setup({ capabilities = capabilities })

-- Java
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
		enable = true,
		nvimtree = true,
		write_and_close = false,
	},
	snippets = {
		enable = true,
	},
	root_markers = {
		"main/java/",
		"test/java/",
	},
})
lspconfig.kotlin_language_server.setup({ capabilities = capabilities })

-- Rust
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
-- Go
lspconfig.gopls.setup({ capabilities = capabilities })
lspconfig.golangci_lint_ls.setup({ capabilities = capabilities })
lspconfig.templ.setup({ capabilities = capabilities })

-- Load VSCode-style snippets
require("luasnip.loaders.from_vscode").lazy_load()
