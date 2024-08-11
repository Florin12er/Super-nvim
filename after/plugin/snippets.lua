local cmp = require("cmp")

cmp.setup({
	-- Configure completion sources
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "codeium" },
		{ name = "path" },
		{ name = "treesitter" },
		{ name = "mkdnflow" },
		{ name = "buffer-lines" },
		{ name = "bulma" },
		{ name = "vimtex" },
		{
			name = "latex_symbols",
			option = {
				strategy = 2, -- mixed strategy
			},
		},
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
	},

	-- Snippet expansion
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	-- Key mappings
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-a>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	-- Formatting
	formatting = {
		format = function(entry, item)
			-- Highlight colors
			local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })

			-- LSP kind formatting
			item = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
				ellipsis_char = "...",
				symbol_map = { Codeium = "" },
			})(entry, item)

			return item
		end,
	},
})
