local rust = require("rust-tools")
local on_attach = require("custom.lsp-defaults").basic_attach

local package_dir = os.getenv("LOCALAPPDATA") .. "\\nvim-data\\mason\\packages\\codelldb\\extension\\"
local codelldb = package_dir .. "adapter\\codelldb.exe"
local lldblib = package_dir .. "lldb\\bin\\liblldb.dll"

rust.setup {
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      local mappings = {
        name = "lspconfig",
        K = { rust.hover_actions.hover_actions, "LSP Hover" },
        ["<leader>lm"] = { rust.expand_macro.expand_macro, "LSP rust expand macro" },
      }

      require("which-key").register(mappings, { buffer = bufnr })
    end,
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(
      codelldb,
      lldblib
    )
  },
  tools = {
    inlay_hints = {
      auto = false
    }
  }
}
