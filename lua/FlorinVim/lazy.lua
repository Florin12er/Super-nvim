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
		"hrsh7th/nvim-cmp",
		{ "hrsh7th/cmp-path" },
		"amarakon/nvim-cmp-buffer-lines",
		{
			"garyhurtz/cmp_bulma.nvim",
		},
		"hrsh7th/cmp-buffer",
		"ray-x/cmp-treesitter",
		"kdheepak/cmp-latex-symbols",
		"micangl/cmp-vimtex",
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
		{ "echasnovski/mini.icons", version = false },
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},
		"projekt0n/github-nvim-theme",
		"joshdick/onedark.vim",
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, enabled = true, opts = ... },
		{ "rose-pine/neovim", name = "rose-pine", enabled = true },
		"Mofiqul/dracula.nvim",
		"shaunsingh/nord.nvim",
		{
			"razak17/tailwind-fold.nvim",
			opts = {},
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			ft = { "html", "svelte", "astro", "vue", "typescriptreact", "javascriptreact", "php", "blade" },
		},
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
		},
		----transparency
		"xiyaowong/transparent.nvim",

		"nvim-tree/nvim-web-devicons",
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		"onsails/lspkind.nvim",

		--telescope plugins
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			-- or                              , branch = '0.1.x',
			dependencies = { "nvim-lua/plenary.nvim" },
		},

		----markdown
		"jakewvincent/mkdnflow.nvim",
		{
			"lervag/vimtex",
			lazy = false, -- we don't want to lazy load VimTeX
			-- tag = "v2.15", -- uncomment to pin to a specific release
			init = function()
				vim.g.vimtex_view_method = "zathura"
			end,
		},
		"Myzel394/easytables.nvim",
		"dhruvasagar/vim-table-mode",
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
		--lsp plugins
		"mfussenegger/nvim-jdtls",
		"simaxme/java.nvim",
		{
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"nvimtools/none-ls-extras.nvim",
			},
		},
		--git plugins
		"lewis6991/gitsigns.nvim",
		"tpope/vim-fugitive",

		--treesitter
		"brenoprata10/nvim-highlight-colors",
		{
			"nvim-treesitter/nvim-treesitter",
		},
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
		--Productivity
		"windwp/nvim-ts-autotag",
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
			-- use opts = {} for passing setup options
			-- this is equalent to setup({}) function
		},
		{
			"stevearc/oil.nvim",
			opts = {},
			dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
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
		--games
		"ThePrimeagen/vim-be-good",
		-- miscellaneous
		"nvim-lua/plenary.nvim",
		{
			"stevearc/dressing.nvim",
			opts = {},
		},
	},
})
