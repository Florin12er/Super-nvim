require("obsidian").setup({
	workspaces = {
		{
			name = "global",
			path = "~",
		},
	},
	notes_subdir = "notes",
	ui = {
		enable = true,
	},
	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},
	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
})
require("mkdnflow").setup({})
require("easytables").setup({})
require("orgmode").setup({
	org_agenda_files = "~/orgfiles/**/*",
	org_default_notes_file = "~/orgfiles/refile.org",
})
--org bullets for markdown and org
require("org-bullets").setup()
vim.cmd([[highlight Headline1 guibg=#1e2718]])
vim.cmd([[highlight Headline2 guibg=#21262d]])
vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])

require("headlines").setup({
	org = {
		headline_highlights = { "Headline1", "Headline2" },
	},
})
require("neorg").setup({
	load = {
		config = {
			workspaces = {
				notes = "~/notes/",
			},
		},
	},
})
