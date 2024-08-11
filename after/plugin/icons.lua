-- Define custom signs for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Customize diagnostic highlights
vim.cmd([[
  highlight DiagnosticError guifg=#FF0000
  highlight DiagnosticWarn guifg=#FFA500
  highlight DiagnosticInfo guifg=#00FF00
  highlight DiagnosticHint guifg=#00FFFF
]])

-- Configure diagnostics
vim.diagnostic.config({
	virtual_text = false, -- Disable inline diagnostic messages
	signs = true, -- Enable signs in the gutter
	update_in_insert = false, -- Do not update diagnostics in insert mode
	underline = true, -- Underline diagnostics
	severity_sort = true, -- Sort diagnostics by severity
	float = {
		border = "rounded", -- Rounded border for floating windows
		source = "always", -- Always show source in floating windows
		header = "", -- No header in floating windows
		prefix = "", -- No prefix in floating windows
	},
})

-- Show diagnostics in a floating window on hover
vim.cmd([[
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
]])
require("gitsigns").setup({})
