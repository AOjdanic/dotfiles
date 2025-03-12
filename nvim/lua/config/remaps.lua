-- disable arrow keys
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- navigating other windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

-- explore current directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- these are for moving highlighted text vertically up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- this one puts the wrapped text in one line, while
-- keeping cursor on same position
vim.keymap.set("n", "J", "mzJ`z")

-- jumping up and down half page, but centered screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- same thing, when going through occurences, centered screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- this deletes the current word, but when you paste it over other word, you
-- can still paste it elsewhere, it didn't get rewritten with the pasted over
-- word
vim.keymap.set("x", "<leader>p", [["_dP]])

-- these are for sharing vim and OS registries
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- this is for deleting in those registries also
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- no idea
vim.keymap.set("n", "Q", "<nop>")

-- creates a new tmux session
vim.keymap.set("n", "<C-f>", ":!tmux neww ~/.local/bin/tmux-sessionizer<CR>", { noremap = true, silent = true })

-- whatever word we are on, will select it and we can replace it
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
  desc = "Go to previous [D]iagnostic message",
})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
  desc = "Go to next [D]iagnostic message",
})
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {
  desc = "Show diagnostic [E]rror messages",
})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
  desc = "Open diagnostic [Q]uickfix list",
})
