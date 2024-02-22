local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("F", "  Find file", ":Telescope find_files <CR>"),
	-- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),

	dashboard.button("a", "  Stats", ":e /home/ub/Dropbox/AIscreening/stats/main.R<CR>"),
	dashboard.button("d", "  Dicom Utils", ":e /home/ub/code/dicom_utils/dicom_utils/ <CR>"),
	dashboard.button("f", "  Fran", ":e /home/ub/code/fran/fran<CR>"),
	dashboard.button("R", "  Regex", ":e /home/ub/code/regex/main.py <CR>"),
	dashboard.button("b", "  RegexBrowser", ":e /home/ub/code/qt/regexbrowser <CR>"),
	dashboard.button("x", "  XNAT", ":e /home/ub/code/xnat/xnat<CR>"),
	dashboard.button("s", "  Slicer Utils", ":e /home/ub/code/slicer_utils/slicer_utils/yes<CR>"),
	dashboard.button("v", "  smartView", ":e /home/ub/code/qt/smartview/  <CR>"),
	dashboard.button("l", "  Label Analysis", ":e /home/ub/code/label_analysis/label_analysis/lm_overlap.py<CR>"),
	dashboard.button("L", "  LiTQ", ":e /home/ub/code/litq/litq<CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/lua/user/plugins.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "UB"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
