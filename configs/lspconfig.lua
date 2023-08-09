local on_attach = require("custom.lsp-defaults").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local schemas = require("schemastore")

-- Sort diagnostics by severity
vim.diagnostic.config {
  update_in_insert = true,
  underline = true,
  severity_sort = true
}

-- Hover doc popup
local pop_opts = { border = "rounded" }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

-- if you just want default config for the servers then put them in a table
local servers = {
  "cssls",
  "clangd",
  "pyright",
  "taplo"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- JSON setup
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      schemas = schemas.json.schemas(),
      validate = { enable = true }
    }
  }
}

-- YAML setup
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml" },
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = schemas.yaml.schemas(),
    },
  }
}

-- Html setup
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" }
}

-- Enable inlay hints for typescript.
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }
  }
}

-- Enable lua setup for plugin development.
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
}

-- Set diagnostic highlight groups and colors:
-- Error
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  undercurl = true,
  bg = "#660000",
  sp = "Red"
})

-- Warning
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  undercurl = true,
  bg = "#40400b",
  sp = "Orange"
})

-- Hint
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
  undercurl = true,
  bg = "#311f33",
  sp = "#c58cec"
})
