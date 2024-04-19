-- written thanks to an awesome NeovimConf 2022 video by DevOnDuty
-- link to talk: https://www.youtube.com/watch?v=PdaObkGazoU

-- Note: To find which highlight name you need to use, put the
--   cursor over it and type `:Inspect`.

-- tip: to debug, use vim.inspect()

-- debug/log with plenary, see with :messages
-- local plenary = require('plenary')
-- local log = require('plenary.log').new {
--     plugin = 'telescope_docker',
--     level = 'info',
-- }

local M = {}

-- use https://coolors.co/ to adapt colors
local c = {
	none = "NONE",
	platinium = "#dadada",
	-- black = "#000000",
	black = "#101010",
	black_eerie = "#1c1c1c",
	black_jet = "#303030",

	comment = "#a8a8a8",
	fg = "#dadada",
	bg = "#1c1c1c",
	bg_alt = "#303030",

	blue_rudy = "#87afd7",
	blue_picton = "#00afff",
	blue_france = "#0087d7",

	gray_davy = "#585858",
	gray_dim = "#707070",
	gray_silver = "#a8a8a8",

	green_light_sea = "#00afaf",
	green_kelly = "#00af00",
	aquamarine = "#00ffaf",

	mauve_french = "#d787d7",
	orange_web = "#ffaf00",

	pink_ultra = "#ff5fff",
	hollywood_cesire = "#ff00af",
	rose_dogwood = "#d7005f",
	red_indian = "#d75f5f",
	red_folly = "#ff005f",
}

function M.highlight(group, color)
	if color.link then
		vim.api.nvim_command("highlight! link " .. group .. " " .. color.link)
	else
		local style = color.style and "gui=" .. color.style or color.preserve and "" or " gui=NONE cterm=NONE"
		local fg = color.fg and "guifg=" .. color.fg or color.preserve and "" or "guifg=NONE ctermfg=NONE"
		local bg = color.bg and "guibg=" .. color.bg or color.preserve and "" or "guibg=NONE ctermbg=NONE"
		local sp = color.sp and "guisp=" .. color.sp or color.preserve and "" or "guisp=NONE"
		vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
	end
end

local default_fg_bg = { fg = c.fg, bg = c.bg }

-- LuaFormatter off
local groups = {
	Normal = default_fg_bg,
	ColorColumn = { fg = c.none, bg = c.black_eerie },
	Conceal = { fg = c.none, bg = c.none },
	CurSearch = { fg = c.pink_ultra, bg = c.black_jet },
	Cursor = { fg = c.none, bg = c.none, style = "reverse" },
	CursorColumn = { fg = c.none, bg = c.black },
	CursorLine = { fg = c.none, bg = c.black_jet },
	CursorLineNr = { fg = c.platinium, bg = c.black },

	DiffAdd = { fg = c.green_kelly, bg = c.black_jet, style = "reverse" },
	DiffChange = { fg = c.blue_rudy, bg = c.black_jet, style = "reverse" },
	DiffDelete = { fg = c.red_indian, bg = c.black_jet, style = "reverse" },
	DiffText = { fg = c.mauve_french, bg = c.black_jet, style = "reverse" },
	SpellBad = { fg = c.rose_dogwood, bg = c.none, sp = c.rose_dogwood, style = "undercurl" },
	SpellCap = { fg = c.blue_france, bg = c.none, sp = c.blue_france, style = "undercurl" },
	SpellLocal = { fg = c.mauve_french, bg = c.none, sp = c.mauve_french, style = "undercurl" },
	SpellRare = { fg = c.green_light_sea, bg = c.none, sp = c.green_light_sea, style = "undercurl" },

	Directory = { fg = c.platinium, bg = c.none },
	EndOfBuffer = { fg = c.gray_dim, bg = c.none },
	ErrorMsg = { fg = c.platinium, bg = c.black_jet, style = "reverse" },
	FoldColumn = { fg = c.gray_dim, bg = c.none },
	Folded = { fg = c.gray_dim, bg = c.black_jet },
	IncSearch = { fg = c.orange_web, bg = c.black_eerie },
	LineNr = { fg = c.gray_silver, bg = c.none },
	MatchParen = { fg = c.platinium, bg = c.pink_ultra, style = "bold" },
	ModeMsg = { fg = c.platinium, bg = c.none },
	MoreMsg = { fg = c.platinium, bg = c.none },
	NonText = { fg = c.gray_dim, bg = c.none },

	Pmenu = { fg = c.gray_silver, bg = c.black_jet },
	PmenuExtra = { fg = c.black, bg = c.gray_silver },
	PmenuKind = { fg = c.black, bg = c.gray_silver, style = "bold" },
	PmenuSbar = { fg = c.black, bg = c.gray_davy },
	PmenuSel = { fg = c.black, bg = c.platinium },
	PmenuExtraSel = { fg = c.black, bg = c.platinium },
	PmenuKindSel = { fg = c.black, bg = c.platinium },
	PmenuThumb = { fg = c.platinium, bg = c.platinium },

	Question = { fg = c.platinium, bg = c.none },
	QuickFixLine = { fg = c.pink_ultra, bg = c.black_jet },
	Search = { fg = c.blue_picton, bg = c.black_jet, style = "reverse" },
	SignColumn = { fg = c.platinium, bg = c.none },
	SpecialKey = { fg = c.gray_dim, bg = c.none, style = "bold" },

	StatusLine = { fg = c.black_jet, bg = c.platinium, style = "bold" },
	StatusLineNC = { fg = c.gray_dim, bg = c.black_jet },
	TabLine = { fg = c.gray_dim, bg = c.black_jet },
	TabLineFill = { fg = c.platinium, bg = c.none },
	TabLineSel = { fg = c.black_jet, bg = c.platinium },
	Title = { fg = c.none, bg = c.none },
	VertSplit = { fg = c.gray_dim, bg = c.black_jet },
	Visual = { fg = c.black_eerie, bg = c.orange_web },
	VisualNOS = { fg = c.none, bg = c.black_jet },
	WarningMsg = { fg = c.platinium, bg = c.none },
	WildMenu = { fg = c.blue_picton, bg = c.black_jet, style = "bold" },
	Comment = { fg = c.comment, bg = c.none },
	Constant = { fg = c.gray_silver, bg = c.none },
	Error = { fg = c.red_folly, bg = c.black_jet, style = "bold" },
	Identifier = { fg = c.platinium, bg = c.none },
	Ignore = { fg = c.platinium, bg = c.none },
	PreProc = { fg = c.platinium, bg = c.none },
	Special = { fg = c.platinium, bg = c.none },
	Statement = { fg = c.platinium, bg = c.none },
	Todo = { fg = c.aquamarine, bg = c.none },
	Type = { fg = c.platinium, bg = c.none },
	Underlined = { fg = c.platinium, bg = c.none },
	CursorIM = { fg = c.black_jet, bg = c.green_light_sea },
	ToolbarLine = { fg = c.none, bg = c.black_jet },
	ToolbarButton = { fg = c.platinium, bg = c.black_jet, style = "bold" },

	Terminal = { link = "Normal" },
	StatusLineTerm = { link = "StatusLine" },
	StatusLineTermNC = { link = "StatusLineNC" },
	MessageWindow = { link = "Pmenu" },
	PopupNotification = { link = "Todo" },
	Boolean = { link = "Constant" },
	Character = { link = "Constant" },
	Conditional = { link = "Statement" },
	Define = { link = "PreProc" },
	Debug = { link = "Special" },
	Delimiter = { link = "Special" },
	Exception = { link = "Statement" },
	Float = { link = "Constant" },
	Function = { link = "Identifier" },
	Include = { link = "PreProc" },
	Keyword = { link = "Statement" },
	Label = { link = "Statement" },
	Macro = { link = "PreProc" },
	Number = { link = "Constant" },
	Operator = { link = "Statement" },
	PreCondit = { link = "PreProc" },
	Repeat = { link = "Statement" },
	SpecialChar = { link = "Special" },
	SpecialComment = { link = "Special" },
	StorageClass = { link = "Type" },
	String = { link = "Constant" },
	Structure = { link = "Type" },
	Tag = { link = "Special" },
	Typedef = { link = "Type" },
	lCursor = { link = "Cursor" },
	debugBreakpoint = { link = "ModeMsg" },
	debugPC = { link = "CursorLine" },
}
-- LuaFormatter on

M.groups = groups
M.colors = c

function M.setup(opts)
	-- print("yay made it!!")
	-- local opts = opts or {}

	M.colorscheme()
end

function M.colorscheme()
	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "quiet2"
	for group, color in pairs(M.groups) do
		M.highlight(group, color)
	end
end

return M
