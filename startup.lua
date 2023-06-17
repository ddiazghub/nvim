vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require("nvim-tree.api").tree.open()
    end,
    group = vim.api.nvim_create_augroup("Startup", { clear = true })
})
