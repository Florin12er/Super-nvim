vim.opt.tabstop = 4
vim.cmd("let g:vimtex_compiler_method = 'latexrun'")
vim.cmd("let g:tex_flavor='latex'")
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
vim.opt.concealcursor = "nc"
--vim.opt.colorcolumn = "100"
vim.cmd("highlight ColorColumn ctermbg=none guibg=#89b4fa")
--vim.ui.select = require("dropbar.utils.menu").select
require("markdown").setup()
vim.opt.termguicolors = true
require("nvim-highlight-colors").setup({})
vim.opt.shortmess:append("I")
vim.o.timeoutlen = 300 -- Default is 1000 (1 second)
vim.o.ttimeoutlen = 10 -- Default is -1 (uses timeoutlen)
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldnestmax = 10
vim.o.foldlevelstart = 99
vim.cmd([[colorscheme tokyonight]])

vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = "" -- custom config file path
require("Comment").setup()
require("mkdnflow").setup({})
require("easytables").setup({})
require("cmp_bulma"):setup()
