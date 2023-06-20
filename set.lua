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

-- Swap files are annoying
vim.opt.swapfile = false
vim.opt.backup = false

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

-- Python provider
vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = os.getenv("LOCALAPPDATA") .. "\\Programs\\Python\\Python311\\python.exe"
