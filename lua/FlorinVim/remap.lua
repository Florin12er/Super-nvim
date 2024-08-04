vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap("n", "<Leader>ls", ":LspStart<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<leader>cl", vim.cmd.HighlightColorsOn)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

vim.keymap.set("n", "<leader>wq", vim.cmd.wq)
vim.keymap.set("n", "<leader>lq", vim.cmd.LiveServerStop)

vim.keymap.set("n", "gt", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>g", ":Git<CR>")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.api.nvim_set_keymap("n", "<Leader>l", ":setlocal spell!<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_dd]])
vim.keymap.set("n", "<leader>m", function()
	vim.cmd("so")
end)

--telescope

vim.api.nvim_set_keymap("n", "<leader>ej", ":Telescope emoji<CR>", { noremap = true, silent = true })
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>cs", builtin.colorscheme, {})
vim.keymap.set("n", "<leader>bb", builtin.buffers, {})

vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Find > ") })
end)
vim.keymap.set("n", "<leader>so", ":SymbolsOutline<CR>", { noremap = true, silent = true })
--harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<leader>w", ui.toggle_quick_menu)

vim.keymap.set("n", "<M-1>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<M-2>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<M-3>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<M-4>", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<M-5>", function()
	ui.nav_file(5)
end)

--px to rem

vim.keymap.set({ "n", "v" }, "<leader>px", ":PxToRemLine<CR>", { noremap = true, silent = true })

--move windows

-- Move to the window to the left
-- vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
-- Move to the window below
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
-- Move to the window above
-- vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
-- Move to the window to the right
-- vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>hs", ":split<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-q>", "<C-w>q", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", "<C-w>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-w>-", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-c>", "<C-w>>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-y>", "<C-w><", { noremap = true, silent = true })

--format

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

--lsp
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
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
		vim.keymap.set("n", "<space>pf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

--git sign
vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.cmd("Gitsigns toggle_signs")
vim.cmd("Gitsigns toggle_current_line_blame")

-- vim test

vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", ":TestVisit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })

--table mode
vim.api.nvim_set_keymap("n", "<Leader>tm", ":TableModeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>te", ":EasyTablesImportThisTable<CR>", { noremap = true, silent = true })

-- navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- netrw

-- Open Netrw in the current window
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { noremap = true, silent = true })
-- Open Netrw in a vertical split
vim.keymap.set("n", "<leader>ev", ":Vexplore<CR>", { noremap = true, silent = true })
-- Open Netrw in a horizontal split
vim.keymap.set("n", "<leader>eh", ":Sexplore<CR>", { noremap = true, silent = true })
-- Open Netrw in a new tab
vim.keymap.set("n", "<leader>et", ":Texplore<CR>", { noremap = true, silent = true })
-- Open Netrw in the current window, showing the directory of the current file
vim.keymap.set("n", "<leader>ef", ":Explore %:p:h<CR>", { noremap = true, silent = true })
-- Set up an autocommand to apply these keybinds only in Netrw buffers
vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end
		-- edit new file
		bind("n", "%")
		-- rename file
		bind("r", "R")
		-- create a new directory
		bind("N", "d") -- 'N' for new directory
		-- remove file or directory
		bind("R", "D") -- 'R' for remove
		-- move file or directory
		bind("m", "m")
		-- copy file or directory
		bind("c", "mc")
		-- open file in vertical split
		bind("V", "v")
		-- open file in horizontal split
		bind("S", "o")
		-- open file in new tab
		bind("T", "t")
		-- go up one directory
		bind("u", "-")
		-- toggle hidden files
		bind(".", "gh")
		-- refresh the directory listing
		bind("R", "<C-l>")
		-- open file with system default application
		bind("x", "gx")
		-- toggle between thin, long, wide, and tree listings
		bind("I", "i")
		-- open preview window
		bind("P", "p")
		-- close preview window
		bind("Q", "P")
		-- close netrw and return to previous buffer
		bind("q", ":Rexplore<CR>")
	end,
})
