local cmp = require("cmp")
cmp.setup({
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
				strategy = 2, -- mixed
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
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-1),
		["<C-f>"] = cmp.mapping.scroll_docs(1),
		["<C-e>"] = cmp.mapping.close(),
		["<C-Space>"] = cmp.mapping.complete(),
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
	formatting = {
		format = function(entry, item)
			local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
			item = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = 50,
				ellipsis_char = "...",
				symbol_map = { Codeium = "" },
			})(entry, item)
			if entry.source.name == "bulma" then
				item.menu = entry.completion_item.menu
				item.documentation = {
					kind = "markdown",
					value = "This is a Bulma snippet. Bulma is a modern CSS framework based on Flexbox.",
				}
			elseif color_item.abbr_hl_group then
				item.kind_hl_group = color_item.abbr_hl_group
				item.kind = color_item.abbr
			end
			return item
		end,
	},
})
