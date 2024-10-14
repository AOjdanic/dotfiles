vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.statuscolumn = "%l | %r"
-- vim.opt.stc = "%=%{v:relnum?v:relnum:v:lnum} "

--vim.opt.mouse = ""
vim.opt.guicursor = vim.opt.guicursor + "a:blinkon400"
-- vim.opt.guicursor = "a:blinkon400"

vim.opt.showmode = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.textwidth = 80
vim.opt.breakindent = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"
vim.opt.scrolloff = 10

vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")

vim.g.netrw_banner = 0
