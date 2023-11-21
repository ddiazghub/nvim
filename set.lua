-- Line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Tabs
-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indent
vim.opt.smartindent = true

-- Wrap is dumb
vim.opt.wrap = false

-- Swap and SHADA files are annoying
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.shadafile = "NONE"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling and I dunno
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- No idea
vim.opt.colorcolumn = "80"

-- Autosave
vim.opt.autowriteall = true

-- Font
vim.opt.guifont = "CaskaydiaCove Nerd Font"
