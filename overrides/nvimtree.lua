-- git support in nvimtree
return {
  disable_netrw = false,
  hijack_netrw = true,

  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<leader>i", api.node.show_info_popup, opts("Info"))
    vim.keymap.set("n", "<C-k>", "10k", opts("Fast scroll up"))
    vim.keymap.set("n", "<C-j>", "10j", opts("Fast scroll down"))
  end
}
