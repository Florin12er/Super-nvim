require("nvim-treesitter.configs").setup({
	sync_install = false,
	ensure_installed = { "html", "css", "markdown", "markdown_inline" },
	auto_install = true,
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
})
vim.treesitter.language.register("html", "ejs")
require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if on of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		["html"] = {
			enable_close = true,
		},
	},
})
require("nvim-treesitter.configs").setup({ ... })

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade",
}

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})
