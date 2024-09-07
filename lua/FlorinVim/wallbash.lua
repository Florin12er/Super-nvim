
local M = {}

-- Define your color palette
M.colors = {
	fg = "#FFFFFF",
	bg = "#2A2A3A",
	selection_fg = "#2A2A3A",
	selection_bg = "#FFFFFF",
	cursor = "#F1D9C2",
	cursor_text = "#060606",

	black = { "#292952", "#57578F" },
	red = { "#FFE5CC", "#F0CCAA" },
	green = { "#D2CCFF", "#B2AAF0" },
	yellow = { "#FFDACC", "#F0BDAA" },
	blue = { "#9A9AE6", "#9A9AE6" },
	magenta = { "#A29AE6", "#A29AE6" },
	cyan = { "#E6AE9A", "#E6AE9A" },
	white = { "#FFE5CC", "#F0CCAA" },
}

-- Set up highlight groups
function M.setup()
	local c = M.colors

	local highlights = {
		-- Basic Neovim highlights
		Normal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg },
		CursorLine = { bg = c.cursor },
		CursorColumn = { bg = c.cursor },
		Visual = { fg = c.selection_fg, bg = c.selection_bg },
		Search = { fg = c.selection_fg, bg = c.selection_bg },
		IncSearch = { fg = c.selection_fg, bg = c.selection_bg },
		LineNr = { fg = c.black[2] },
		CursorLineNr = { fg = c.yellow[1] },
		VertSplit = { fg = c.black[1], bg = c.bg },
		StatusLine = { fg = c.fg, bg = c.black[1] },
		StatusLineNC = { fg = c.black[2], bg = c.bg },
		Pmenu = { fg = c.fg, bg = c.black[1] },
		PmenuSel = { fg = c.bg, bg = c.blue[1] },
		PmenuSbar = { bg = c.black[1] },
		PmenuThumb = { bg = c.black[2] },

		-- Syntax highlighting
		Comment = { fg = c.black[2] },
		Constant = { fg = c.cyan[1] },
		String = { fg = c.green[1] },
		Character = { fg = c.green[1] },
		Number = { fg = c.yellow[1] },
		Boolean = { fg = c.yellow[1] },
		Float = { fg = c.yellow[1] },
		Identifier = { fg = c.red[1] },
		Function = { fg = c.blue[1] },
		Statement = { fg = c.magenta[1] },
		Conditional = { fg = c.magenta[1] },
		Repeat = { fg = c.magenta[1] },
		Label = { fg = c.magenta[1] },
		Operator = { fg = c.fg },
		Keyword = { fg = c.magenta[1] },
		Exception = { fg = c.magenta[1] },
		PreProc = { fg = c.blue[1] },
		Include = { fg = c.blue[1] },
		Define = { fg = c.blue[1] },
		Macro = { fg = c.blue[1] },
		PreCondit = { fg = c.blue[1] },
		Type = { fg = c.cyan[1] },
		StorageClass = { fg = c.cyan[1] },
		Structure = { fg = c.cyan[1] },
		Typedef = { fg = c.cyan[1] },
		Special = { fg = c.yellow[1] },
		SpecialChar = { fg = c.yellow[1] },
		Tag = { fg = c.red[1] },
		Delimiter = { fg = c.fg },
		SpecialComment = { fg = c.black[2] },
		Debug = { fg = c.red[1] },
		Underlined = { fg = c.blue[1], underline = true },
		Ignore = { fg = c.black[2] },
		Error = { fg = c.red[1], bold = true, underline = true },
		Todo = { fg = c.yellow[1], bold = true, underline = true },

       TelescopeNormal = { fg = c.fg, bg = c.bg },
    TelescopePrompt = { fg = c.fg, bg = c.black[1] },
    TelescopePromptNormal = { fg = c.fg, bg = c.black[1] },
    TelescopePromptBorder = { fg = c.black[1], bg = c.black[1] },
    TelescopeResultsNormal = { fg = c.fg, bg = c.bg },
    TelescopePreviewNormal = { fg = c.fg, bg = c.bg },
    TelescopePreviewBorder = { fg = c.bg, bg = c.bg },
    
    -- Additional Telescope highlights
    TelescopePromptTitle = { fg = c.fg, bg = c.blue[1] },
    TelescopeResultsTitle = { fg = c.fg, bg = c.green[1] },
    TelescopePreviewTitle = { fg = c.fg, bg = c.magenta[1] },
    TelescopeMatching = { fg = c.yellow[1] },

	}

	-- Apply highlights
	for group, colors in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, colors)
	end
end

-- Function to get lualine colors
function M.get_lualine_colors()
	local c = M.colors
	return {
		normal = {
			a = { fg = c.bg, bg = c.blue[1] },
			b = { fg = c.fg, bg = c.black[1] },
			c = { fg = c.fg, bg = c.bg },
		},
		insert = { a = { fg = c.bg, bg = c.green[1] } },
		visual = { a = { fg = c.bg, bg = c.magenta[1] } },
		replace = { a = { fg = c.bg, bg = c.red[1] } },
		inactive = {
			a = { fg = c.fg, bg = c.black[1] },
			b = { fg = c.fg, bg = c.black[1] },
			c = { fg = c.fg, bg = c.bg },
		},
	}
end

return M

