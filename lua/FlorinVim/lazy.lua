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
	{
		--cmp plugins
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		"amarakon/nvim-cmp-buffer-lines",
		"hrsh7th/cmp-buffer",
		"ray-x/cmp-treesitter",
		{
			"David-Kunz/cmp-npm",
			dependencies = { "nvim-lua/plenary.nvim" },
			ft = "json",
		},
		"amarakon/nvim-cmp-fonts",
		"hrsh7th/cmp-emoji",
		"uga-rosa/cmp-dictionary",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		{ "rafamadriz/friendly-snippets" },
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
				"saadparwaiz1/cmp_luasnip",
			},
		},

		--colors
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, enabled = true, opts = ... },
		"akai54/2077.nvim",
		{ "rose-pine/neovim", name = "rose-pine", enabled = true },
		{ "decaycs/decay.nvim", as = "decay" },
		"marko-cerovac/material.nvim",
		"Mofiqul/dracula.nvim",
		"shaunsingh/nord.nvim",
		"nyoom-engineering/oxocarbon.nvim",
		"EdenEast/nightfox.nvim",
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
		},
		----transparency
		"xiyaowong/transparent.nvim",

		--look plugins

		----DashBoard
		{
			"goolord/alpha-nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},

		"nvim-tree/nvim-web-devicons",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		"simrat39/symbols-outline.nvim",

		----better folding
		{
			"kevinhwang91/nvim-ufo",
			dependencies = "kevinhwang91/promise-async",
		},
		----better loking command mode
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {},
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		},
		----dropbar
		{
			"Bekaboo/dropbar.nvim",
			dependencies = {
				"nvim-telescope/telescope-fzf-native.nvim",
			},
		},
		"onsails/lspkind.nvim",

		--telescope plugins
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.5",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"mrjones2014/tldr.nvim",
			dependencies = { "nvim-telescope/telescope.nvim" },
		},
		"nvim-telescope/telescope-fzf-native.nvim",
		----emojis
		"xiyaowong/telescope-emoji.nvim",
		{
			"2kabhishek/nerdy.nvim",
			dependencies = {
				"stevearc/dressing.nvim",
				"nvim-telescope/telescope.nvim",
			},
			cmd = "Nerdy",
		},

		--ai plugins
		{
			"Exafunction/codeium.vim",
			enabled = false,
		},
		"David-Kunz/gen.nvim",
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",
			},
			enabled = false,
		},

		--notes plugins
		"vimwiki/vimwiki",
		"preservim/vim-pencil",
		{
			"vhyrro/luarocks.nvim",
			priority = 1000,
			config = true,
		},
		"nvim-neorg/neorg-telescope",
		"nvim-neorg/norg-specs",
		{
			"nvim-neorg/neorg",
			build = ":Neorg sync-parsers",
			lazy = false,
			dependencies = {
				"nvim-neorg/norg-specs",
				"nvim-lua/plenary.nvim",
				"nvim-neorg/neorg-telescope",
				"luarocks.nvim",
			},
		},
		{
			"epwalsh/obsidian.nvim",
			version = "*",
			lazy = true,
			ft = "markdown",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},

		----live server and markdown preview
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},
		{
			"barrett-ruth/live-server.nvim",
			build = "npm global add live-server",
			config = true,
		},

		--zen mode
		"folke/twilight.nvim",
		"folke/zen-mode.nvim",

		--lsp plugins
		"mfussenegger/nvim-jdtls",
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		"nvimtools/none-ls.nvim",

		--git plugins
		"lewis6991/gitsigns.nvim",
		"tpope/vim-fugitive",
		{
			"kdheepak/lazygit.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},

		--treesitter
		"norcalli/nvim-colorizer.lua",
		"nvim-treesitter/nvim-treesitter",
		"brenoprata10/nvim-highlight-colors",
		"maxmellon/vim-jsx-pretty",

		--Productivity
		{
			"jsongerber/nvim-px-to-rem",
			config = true,
		},
		"windwp/nvim-ts-autotag",
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
		"ThePrimeagen/harpoon",
		"voldikss/vim-floaterm",
		"mbbill/undotree",
		{
			"vim-test/vim-test",
			dependencies = {
				"preservim/vimux",
			},
		},
		{
			"numToStr/Comment.nvim",
			lazy = false,
		},
		{ "christoomey/vim-tmux-navigator", lazy = false },
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "VeryLazy",
		},
		--games
		"ThePrimeagen/vim-be-good",
		"kwakzalver/duckytype.nvim",

		-- miscellaneous
		"nvim-lua/plenary.nvim",
	},
})
