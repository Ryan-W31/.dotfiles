local o = vim.opt
local d = vim.diagnostic

-- Editor options

o.number = true
o.relativenumber = true
o.clipboard = "unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.title = true
o.hidden = true
o.ttimeoutlen = 0
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.splitright = true
o.splitbelow = true
o.termguicolors = true
o.wrap = false
o.winborder = "rounded"

-- Diagnostics options
d.config({
	severity_sort = true,
	signs = {
		text = {
			[d.severity.ERROR] = "✘",
			[d.severity.WARN] = "",
			[d.severity.HINT] = "",
			[d.severity.INFO] = "",
		},
	},
	virtual_text = true,
})
