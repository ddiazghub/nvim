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

-- Wrap looks bad
vim.opt.wrap = false

-- Swap files are annoying
vim.opt.swapfile = false
vim.opt.backup = false

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling and I dunno
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"
vim.opt.updatetime = 50

-- No idea
vim.opt.colorcolumn = "80"

-- Autosave
vim.opt.autowriteall = true

-- Font
vim.opt.guifont = "CaskaydiaCove Nerd Font"

-- Default SQL database connection for autocomplete
vim.g.db = "postgresql://test:123456@localhost/test"

-- Browser for markdown preview
if vim.loop.os_uname().sysname == "Linux" then
  vim.g.mkdp_browser = "wslview"
end
