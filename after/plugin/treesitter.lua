require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = true,
	autotag = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	ignore_install = { "org" },
})
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
vim.treesitter.language.register("html", "ejs")
