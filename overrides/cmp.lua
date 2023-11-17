local cmp = require("cmp")

return {
  -- Autocompletion in Dap UI
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
  end,
  -- Dont suggest Text from lsp
  sources = cmp.config.sources {
    {
      name = "nvim_lsp",
      entry_filter = function(entry, _)
        return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
      end
    },
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lua" },
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-n>"] = cmp.mapping.complete(),
    ["<C-q>"] = cmp.mapping.abort(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  }
}
