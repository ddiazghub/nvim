local startup = vim.api.nvim_create_augroup("Startup", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Open nvim-tree on startup
    local first = vim.fn.argv(0)

    if first == "." then
      require("nvim-tree.api").tree.open()
    end
  end,
  group = startup
})

local buffer = vim.api.nvim_create_augroup("Buffer", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Run standalone rust-analyzer server on files not belonging to cargo project
    local cwd = vim.fn.getcwd()

    if vim.bo.filetype == "rust" and vim.fn.filereadable(cwd .. "\\Cargo.toml") == 0 then
      vim.cmd[[RustStartStandaloneServerForBuffer]]
    end
  end,
  group = buffer
})
