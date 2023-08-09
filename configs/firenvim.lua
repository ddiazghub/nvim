vim.api.nvim_set_keymap("n", "<Esc><Esc>", "<Cmd>call firenvim#focus_page()<CR>", {})
vim.api.nvim_set_keymap("n", "<C-x>", "<Cmd>call firenvim#hide_frame()<CR>", {})

vim.g.firenvim_config = {
  localSettings = {
    [".*"] = {
      priority = 0,
      takeover = "never"
    },
  }
}
