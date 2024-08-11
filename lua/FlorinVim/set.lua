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
vim.o.wrap = false
vim.o.linebreak = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.cmd("Gitsigns toggle_signs")
vim.cmd("Gitsigns toggle_current_line_blame")

-- Performance
vim.opt.updatetime = 50

-- VimTeX
vim.cmd("let g:vimtex_compiler_method = 'latexrun'")
vim.cmd("let g:tex_flavor='latex'")

-- Other Plugins
require("Comment").setup()
require("cmp_bulma"):setup()
require("oil").setup()
-- Colorscheme
vim.cmd([[colorscheme onedark]])

-- Terminal Colors
vim.cmd("set t_Co=256")
vim.cmd(":set termguicolors")

-- Compatibility
vim.o.compatible = false

-- UI Settings
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 10

require("lualine").setup({
	options = {
		theme = "onedark",
	},
})
-- Miscellaneous
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append("I")
vim.o.winfixheight = true
vim.cmd([[autocmd VimEnter * LspStart<CR>]])
vim.cmd("TransparentEnable")
vim.loader.enable()
