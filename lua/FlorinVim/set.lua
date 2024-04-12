vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.cmd("set number")
vim.cmd("set foldcolumn=0")
vim.cmd("set relativenumber")
vim.cmd("set signcolumn=no")
vim.cmd("set cursorline")
vim.cmd("set conceallevel=2")
vim.cmd("autocmd FileType org setlocal nofoldenable")
vim.cmd("TransparentEnable")

vim.o.winfixheight = true

vim.cmd("set t_Co=256")
vim.o.compatible = false

vim.cmd("filetype plugin on")
vim.cmd(":set termguicolors")
vim.cmd([[autocmd VimEnter * LspStart<CR>]])
vim.opt.updatetime = 50
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
--vim.opt.colorcolumn = "100"
vim.cmd("highlight ColorColumn ctermbg=none guibg=#89b4fa")
require("notify").setup({
	background_colour = "#000000",
})
require("duckytype").setup({})
vim.cmd("let test#strategy = 'vimux'")

--[[ require("codeium").setup({}) ]]
require("nvim-surround").setup({})
vim.ui.select = require("dropbar.utils.menu").select

require("ccc").setup()
require("autoclose").setup()
require'colorizer'.setup()
require("markdown").setup()
