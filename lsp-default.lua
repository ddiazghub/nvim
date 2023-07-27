function LspKeymaps(bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr })
  vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, { buffer = bufnr })

  vim.keymap.set("n", "<leader>fd", function()
    vim.diagnostic.goto_prev { float = { border = "rounded" } }
  end, { buffer = bufnr })

  vim.keymap.set("n", "<leader>fd", function()
    vim.diagnostic.goto_next { float = { border = "rounded" } }
  end, { buffer = bufnr })

  vim.keymap.set("n", "<leader>fd", function()
    vim.diagnostic.open_float { border = "rounded" }
  end, { buffer = bufnr })

  vim.keymap.set("n", "<leader>ra", function()
    require("nvchad_ui.renamer").open()
  end, { buffer = bufnr })

  vim.keymap.set("n", "<leader>fm", function()
    vim.lsp.buf.format { async = true}
  end, { buffer = bufnr })
end
