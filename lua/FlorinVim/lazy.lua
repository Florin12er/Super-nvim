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
		{
			"roobert/palette.nvim",
			lazy = false,
			priority = 1000,
		},
		"projekt0n/github-nvim-theme",
		{
			"neanias/everforest-nvim",
			version = false,
			lazy = false,
			priority = 1000, -- make sure to load this before all the other start plugins
			-- Optional; default configuration will be used if setup isn't called.
			config = function()
				require("everforest").setup({
					-- Your config here
				})
			end,
		},
		"joshdick/onedark.vim",
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
			enabled = false,
			dependencies = {
				"nvim-telescope/telescope-fzf-native.nvim",
			},
		},
		"onsails/lspkind.nvim",

		--telescope plugins
		"junegunn/fzf.vim",
		{
			"mrjones2014/tldr.nvim",
			dependencies = { "nvim-telescope/telescope.nvim" },
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
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
		"David-Kunz/gen.nvim",
		--notes plugins

		----markdown
		"jakewvincent/mkdnflow.nvim",
		{
			"vhyrro/luarocks.nvim",
			priority = 1001, -- this plugin needs to run before anything else
			opts = {
				rocks = { "magick" },
			},
		},
		{
			"3rd/image.nvim",
			dependencies = { "luarocks.nvim" },
			config = function() end,
		},
		"preservim/vim-pencil",
		"ekickx/clipboard-image.nvim",
		"Myzel394/easytables.nvim",
		"dhruvasagar/vim-table-mode",
		{
			"epwalsh/obsidian.nvim",
			version = "*",
			lazy = true,
			ft = "markdown",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"lukas-reineke/headlines.nvim",
			dependencies = "nvim-treesitter/nvim-treesitter",
			opts = {},
		},
		"akinsho/org-bullets.nvim",
		----live server , markdown preview, markmap
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && yarn install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		},
		{
			"tadmccorkle/markdown.nvim",
			ft = "markdown", -- or 'event = "VeryLazy"'
			opts = {
				-- configuration here or empty for defaults
			},
		},
		{
			"barrett-ruth/live-server.nvim",
			build = "npm global add live-server",
			config = true,
		},
		{
			"Zeioth/markmap.nvim",
			build = "yarn global add markmap-cli",
			cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
			opts = {
				html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
				hide_toolbar = false, -- (default)
				grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
			},
			config = function(_, opts)
				require("markmap").setup(opts)
			end,
		},
		--zen mode
		"folke/twilight.nvim",
		"folke/zen-mode.nvim",

		--lsp plugins
		"mfussenegger/nvim-jdtls",
		"simaxme/java.nvim",
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
		"nvim-treesitter/nvim-treesitter-context",
		"norcalli/nvim-colorizer.lua",
		"nvim-treesitter/nvim-treesitter",
		"uga-rosa/ccc.nvim",
		"maxmellon/vim-jsx-pretty",

		--Productivity
		{
			"jsongerber/nvim-px-to-rem",
			config = true,
		},
		"windwp/nvim-ts-autotag",
		"m4xshen/autoclose.nvim",
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			config = true,
		},
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
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"JMarkin/nvim-tree.lua-float-preview",
				lazy = true,
			},
		},
		{
			"gsuuon/tshjkl.nvim",
			config = true,
		},
		--games
		"ThePrimeagen/vim-be-good",
		"kwakzalver/duckytype.nvim",
		{
			"m4xshen/hardtime.nvim",
			dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		},

		-- miscellaneous
		"nvim-lua/plenary.nvim",
	},
})
