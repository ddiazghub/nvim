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

-- Autosave
vim.opt.autowriteall = true

local function save()
  if vim.api.nvim_buf_get_option(0, "modified") and vim.bo.buftype ~= "prompt" then
    vim.cmd[[w]]
  end
end

local autosave = vim.api.nvim_create_augroup("Autosave", {})

-- Autosave on InsertEnter
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = save,
  group = autosave,
  nested = true
})

-- Autosave on InsertLeave
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = save,
  group = autosave,
  nested = true
})
