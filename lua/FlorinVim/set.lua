vim.opt.guicursor = ""
-- Theme
local theme = "dracula"
-- Tabs and Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- File Handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Display
vim.opt.colorcolumn = "80"
vim.cmd("highlight ColorColumn ctermbg=NONE guibg=lightgrey")
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Gitsigns
vim.cmd("Gitsigns toggle_signs")
vim.cmd("Gitsigns toggle_current_line_blame")

-- Performance
vim.opt.updatetime = 50

-- VimTeX
vim.g.vimtex_compiler_method = "latexrun"
vim.g.tex_flavor = "latex"

-- Other Plugins
require("Comment").setup()
require("nvim-surround").setup({})
require("cmp_bulma").setup()
require("oil").setup({
	default_file_explorer = true,
	skip_confirm_for_simple_edits = true,
	delete_to_trash = false,
	use_default_keymaps = true,
	view_options = {
		show_hidden = true,
	},
})
-- local wallbash = require("FlorinVim.wallbash")
-- wallbash.setup()
--

require("lualine").setup({
	options = {
		theme = theme,
	},
})
vim.cmd("colorscheme " .. theme)
-- Terminal Colors
vim.opt.termguicolors = true

-- Compatibility
vim.opt.compatible = false

-- UI Settings
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- Miscellaneous
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append("I")
vim.opt.winfixheight = true

-- Autocommands
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	command = "LspStart",
})

vim.cmd("TransparentEnable")

vim.loader.enable()

require("nvim-highlight-colors").setup({})
