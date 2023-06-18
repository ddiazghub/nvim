local startup = vim.api.nvim_create_augroup("Startup", { clear = true })

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require("nvim-tree.api").tree.open()
    end,
    group = startup
})
