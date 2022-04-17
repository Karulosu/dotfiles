local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local indent = 4
local opt = vim.opt
local g = vim.g

cmd "syntax enable"
cmd "filetype indent on"
-- cmd "inoremap jj <Esc>"
cmd "map <silent> <esc> :noh <CR>"
cmd "set expandtab"
cmd "set smartindent"
cmd "set nowrapscan"
cmd "set nolist wrap linebreak breakat&vim"
o.shiftwidth = indent
o.tabstop = indent
o.softtabstop = indent
o.autoindent = true
o.termguicolors = true
o.hidden = true
o.breakindent = true
o.ignorecase = true
o.scrolloff = 1
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamed,unnamedplus"
o.timeoutlen = 300
o.updatetime = 300
o.laststatus = 3
o.inccommand = "split"
o.cmdheight = 1
o.sidescrolloff = 8
o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
o.history = 100
o.lazyredraw = true
o.synmaxcol = 240
o.mouse = "a"
o.number = true
o.relativenumber = true
o.scrolloff = 2
o.cursorline = true

vim.wo.colorcolumn = "99999"
