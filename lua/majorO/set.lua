--keeps the cursor thicc at all times.
--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false 
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.g.mapleader = " "

--set the clipboard for WSL
--vim.g.clipboard = {
--    name= "WslClipboard",
--    copy = {
--        ["+"] = "clip.exe",
--        ["*"] = "clip.exe",
--    },
--    paste = {
--        ["+"] = 'powershell.exe -c [console]::out.write($(get-clipboard -raw).tostring().replace("`r", ""))',
--        ["*"] = 'powershell.exe -c [console]::out.write($(get-clipboard -raw).tostring().replace("`r", ""))',
--    },
--    cache_enabled = 0,
--}
--vim.opt.clipboard='unnamedplus'

