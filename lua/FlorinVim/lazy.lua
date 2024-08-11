local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- CMP Plugins
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
		"amarakon/nvim-cmp-buffer-lines",
		"garyhurtz/cmp_bulma.nvim",
		"hrsh7th/cmp-buffer",
		"ray-x/cmp-treesitter",
		"kdheepak/cmp-latex-symbols",
		"micangl/cmp-vimtex",
		"hrsh7th/cmp-nvim-lsp",
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
				"saadparwaiz1/cmp_luasnip",
			},
		},
	},
	-- Colorschemes
	{
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},
		"projekt0n/github-nvim-theme",
		"joshdick/onedark.vim",
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
		},
		{
			"ellisonleao/gruvbox.nvim",
			priority = 1000,
			config = true,
			enabled = true,
		},
		{
			"rose-pine/neovim",
			name = "rose-pine",
			enabled = true,
		},
		"Mofiqul/dracula.nvim",
		"shaunsingh/nord.nvim",
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
		},
	},
	-- Transparency
	"xiyaowong/transparent.nvim",
	-- UI Enhancements
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"onsails/lspkind.nvim",
	-- Telescope Plugins
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- LaTeX Support
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		init = function()
			vim.g.vimtex_view_method = "zathura"
		end,
	},
	-- LSP Plugins
	{
		"mfussenegger/nvim-jdtls",
		"simaxme/java.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"nvimtools/none-ls-extras.nvim",
			},
		},
	},
	-- Git Plugins
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	-- Treesitter
	"brenoprata10/nvim-highlight-colors",
	"nvim-treesitter/nvim-treesitter",
	"maxmellon/vim-jsx-pretty",
	"Exafunction/codeium.vim",
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
	-- Productivity
	{
		"windwp/nvim-ts-autotag",
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
	-- Games
	"ThePrimeagen/vim-be-good",
})
