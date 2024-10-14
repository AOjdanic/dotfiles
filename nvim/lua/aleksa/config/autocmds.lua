vim.cmd([[autocmd TextYankPost * lua vim.highlight.on_yank({on_visual=true})]])
