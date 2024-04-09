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


nvimtree.setup({
	disable_netrw = true,
	on_attach = on_attach,
	hijack_netrw = true,
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	view = {
		relativenumber = true,
        side = "right",
	},
	-- filters = {
	--   custom = { "^.git$" },
	-- },
	-- renderer = {
	--   indent_width = 1,
	-- },
})
require("float-preview").setup({})
