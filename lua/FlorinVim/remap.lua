-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Visual Mode Adjustments
-- Move selected lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigation Enhancements
-- Keep cursor position when joining lines
vim.keymap.set("n", "J", "mzJ`z")
-- Center screen after page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Center screen after searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Clipboard and Paste
-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Paste over selection without affecting register
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Delete without affecting register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_dd]])

-- Telescope Integration
local builtin = require("telescope.builtin")
-- Find string using Telescope
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Find > ") })
end)

-- Harpoon Integration
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
-- Add file to Harpoon
vim.keymap.set("n", "<leader>m", mark.add_file)
-- Toggle Harpoon quick menu
vim.keymap.set("n", "<leader>w", ui.toggle_quick_menu)
-- Navigate to Harpoon files
for i = 1, 9 do
	vim.keymap.set("n", "<M-" .. i .. ">", function()
		ui.nav_file(i)
	end)
end

-- Formatting
-- Format buffer using LSP
vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})

-- LSP Keybindings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = ev.buf }
		-- LSP-related keybindings
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-he>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	end,
})

-- Codeium Integration
-- Accept Codeium suggestion
vim.keymap.set("i", "<C-c>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

-- Flash.nvim Integration
-- Jump using flash.nvim
vim.keymap.set({ "n", "o", "x" }, "s", function()
	require("flash").jump()
end)
-- Use treesitter with flash.nvim
vim.keymap.set({ "n", "o", "x" }, "S", function()
	require("flash").treesitter()
end)
-- Remote jump with flash.nvim
vim.keymap.set({ "n", "o", "x" }, "r", function()
	require("flash").remote()
end)
-- Treesitter search with flash.nvim
vim.keymap.set({ "n", "o", "x" }, "R", function()
	require("flash").treesitter_search()
end)
-- Toggle flash.nvim
vim.keymap.set({ "n", "o", "x" }, "<c-s>", function()
	require("flash").toggle()
end)

-- Which-key Integration
-- Show global keymaps
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = true })
end, { desc = "Global Keymaps (which-key)" })

-- Which-key Keybindings
local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "find" }, -- Group for find commands
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
	{ "<leader>cs", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", mode = "n" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", mode = "n" },
	{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files", mode = "n" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", mode = "n" },
	{
		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- Quit command
	},
	{
		mode = "n",
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
		{ "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" },
		{ "<leader>g", "<cmd>Git<cr>", desc = "Git" },
		{ "<leader>gs", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle Gitsigns" },
		{ "<leader>x", "<cmd>!chmod +x %<CR>", desc = "Make Executable" },
		{ "<leader>hs", "<cmd>split<CR>", desc = "Horizontal Split" },
		{ "<leader>vs", "<cmd>vsplit<CR>", desc = "Vertical Split" },
		{ "<leader>l", ":setlocal spell!<CR>", desc = "Spell Check" },
		{ "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace Word" },
	},
})
