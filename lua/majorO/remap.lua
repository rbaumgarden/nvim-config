vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--move line selection up or down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--merge lines without moving cursor.
vim.keymap.set("n", "J", "mzJ`z")

--half page jumping while leaving cursor static.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--keep cursor in the middle while iterating search terms.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--put without overwriting put register.
vim.keymap.set("x", "<leader>p", "\"_dP")

--use system register (clipboard).
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--delete to void register.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--call Esc to quit insert incase we are inserting in Visual Block.
vim.keymap.set("i", "<C-c>", "<Esc>")

--i don't know why this is bad exactly, but it does naughty register duplication things.
vim.keymap.set("n", "Q", "<nop>")

--skipping tmux-specific mapping.

--format via lsp
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

--quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>rnext<CR>zz")

--replace word under cursor.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--sets a file to executable.  useful for bash scripts.
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

