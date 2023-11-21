local defaults = require "custom.lsp-defaults"
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local schemas = require "schemastore"

local on_attach = defaults.on_attach
local other_capabilities = defaults.capabilities

-- Sort diagnostics by severity
vim.diagnostic.config {
  update_in_insert = true,
  underline = true,
  severity_sort = true,
}

-- Hover doc popup
local pop_opts = { border = "rounded" }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

-- If you just want default config for the servers then put them in a table
local servers = {
  "cssls",
  "clangd",
  "pyright",
  "taplo",
  "omnisharp",
  "vimls",
}

-- Set up default configurations
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- CUSTOM CONFIGS

-- C# Setup
local csharp_attach = function(client, bufnr)
  on_attach(client, bufnr)

  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
end

lspconfig.csharp_ls.setup {
  on_attach = csharp_attach,
  on_init = function(client, _)
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.semanticTokensProvider = false  -- turn off semantic tokens
    end
  end,
  capabilities = capabilities,
  filetypes = { "cs" },
  root_dir = function(startpath)
    print("file: " .. vim.api.nvim_buf_get_name(0))
    print("dir: " .. require("lspconfig.util").path.dirname(vim.api.nvim_buf_get_name(0)))
    return lspconfig.util.root_pattern "*.sln"(startpath)
      or lspconfig.util.root_pattern "*.csproj"(startpath)
      or lspconfig.util.root_pattern "*.fsproj"(startpath)
      or lspconfig.util.root_pattern ".git"(startpath)
      or require("lspconfig.util").path.dirname(
        vim.api.nvim_buf_get_name(0)
      )
  end,
  single_file_support = true,
}

-- Bash setup
lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh", "zsh" },
}

-- JSON setup
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      schemas = schemas.json.schemas(),
      validate = { enable = true },
    },
  },
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
  },
}

-- Html setup
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" },
}

local inlay_hint_config = {
  enumMemberValues = { enabled = true },
  parameterNames = {
    enabled = "all",
    suppressWhenArgumentMatchesName = true,
  },
  parameterTypes = { enabled = true },
  includeInlayParameterNameHints = "all",
  functionLikeReturnTypes = { enabled = true },
  propertyDeclarationTypes = { enabled = true },
  variableTypes = {
    enabled = true,
    suppressWhenTypeMatchesName = true,
  },
}

-- Enable inlay hints for typescript.
lspconfig.vtsls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    typescript = { inlayHints = inlay_hint_config },
    javascript = { inlayHints = inlay_hint_config },
  },
}

-- Enable lua setup for plugin development.
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

-- Set diagnostic highlight groups and colors:
-- Error
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  undercurl = true,
  bg = "#660000",
  sp = "Red",
})

-- Warning
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
  undercurl = true,
  bg = "#40400b",
  sp = "Orange",
})

-- Hint
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
  undercurl = true,
  bg = "#311f33",
  sp = "#c58cec",
})
