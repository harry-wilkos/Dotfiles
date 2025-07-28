vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.signcolumn = "yes"

vim.o.wrap = false
vim.o.linebreak = false
vim.o.autoindent = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.fileencoding = "utf-8"
vim.o.hlsearch = true
vim.o.hidden = true

vim.o.undofile = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.updatetime = 100


vim.o.cursorline = true
vim.o.cursorlineopt ="number"

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.cmd("filetype plugin indent on")

vim.opt.iskeyword:append "-"
vim.o.breakindent = true
vim.o.backspace = 'indent,eol,start'
vim.o.showtabline = 2
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.swapfile = false
vim.opt.nrformats:remove("octal")
vim.opt.ruler = true
vim.opt.wildmenu = true
vim.opt.listchars = { tab = "> ", trail = "-", extends = ">", precedes = "<", nbsp = "+" }
vim.o.autoread = true
vim.o.mousemoveevent = true
