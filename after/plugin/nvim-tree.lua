local function on_attach(bufnr)
	local api = require("nvim-tree.api")
     api.config.mappings.default_on_attach(bufnr)
	local FloatPreview = require("float-preview")
	FloatPreview.attach_nvimtree(bufnr)
end
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- vi..opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false --                  " Disable folding at startup.

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local HEIGHT_RATIO = 0.87 -- You can change this
local WIDTH_RATIO = 0.333 -- You can change this too

nvimtree.setup({
	disable_netrw = true,
	on_attach = on_attach,
	hijack_netrw = true,
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	view = {
		relativenumber = true,
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 14
				local center_y = ((vim.opt.lines:get() - window_h) / 3) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},
	-- filters = {
	--   custom = { "^.git$" },
	-- },
	-- renderer = {
	--   indent_width = 1,
	-- },
})
local HEIGHT_PADDING = 4
local WIDTH_PADDING = 15
require("float-preview").setup({
	window = {
		wrap = false,
		trim_height = false,
		open_win_config = function()
			local screen_w = vim.opt.columns:get()
			local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
			local window_w_f = (screen_w - WIDTH_PADDING * 2 - 1) / 1.41
			local window_w = math.floor(window_w_f)
			local window_h = screen_h - HEIGHT_PADDING * 2
			local center_x = window_w_f + WIDTH_PADDING + 2
			local center_y = ((vim.opt.lines:get() - window_h) / 3) - vim.opt.cmdheight:get()

			return {
				style = "minimal",
				relative = "editor",
				border = "single",
				row = center_y,
				col = center_x,
				width = window_w,
				height = window_h,
			}
		end,
	},
})
