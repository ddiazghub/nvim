local on_attach = require("plugins.configs.lspconfig").on_attach

local keymaps = function(client, bufnr)
  local hover = vim.lsp.buf.hover

  if client.name == "csharp_ls" or client.name == "omnisharp" then
    hover = "<Cmd>Lspsaga hover_doc<CR>"
  end

  local mappings = {
    name = "lsp",
    K = { hover, "LSP Hover" },
    gd = { vim.lsp.buf.definition, "lsp goto definition" },
    gt = { vim.lsp.buf.type_definition, "lsp goto type definition" },
    gi = {  "<Cmd>Lspsaga finder imp<CR>", "LSP goto implementation" },
    gr = { "<Cmd>Lspsaga finder ref<CR>", "LSP goto references" },
    ["<leader>ld"] = { "<Cmd>Lspsaga peek_definition<CR>", "LSP peek definition" },
    ["<leader>lt"] = { "<Cmd>Lspsaga peek_type_definition<CR>", "LSP peek type definition" },
    ["<leader>li"] = { "<Cmd>Lspsaga finder imp<CR>", "LSP goto implementation" },
    ["<leader>lf"] = { "<Cmd>Lspsaga finder<CR>", "LSP finder" },
    ["<leader>lo"] = { "<Cmd>Lspsaga outline<CR>", "LSP outline" },
    ["<leader>la"] = { "<Cmd>Lspsaga code_action<CR>", "LSP code actions" },
    ["<leader>lbd"] = { "<Cmd>Lspsaga show_buf_diagnostics<CR>", "LSP buffer diagnostics" },
    ["<leader>lwd"] = { "<Cmd>Lspsaga show_workspace_diagnostics<CR>", "LSP workspace diagnostics" },
    gD = { vim.lsp.buf.declaration, "LSP goto declaration" },
    ["<leader>ls"] = { vim.lsp.buf.signature_help, "LSP signature help" },
    ["[g"] = { "<Cmd>:Lspsaga diagnostic_jump_prev<CR>", "LSP go to previous diagnostic" },
    ["]g"] = { "<Cmd>:Lspsaga diagnostic_jump_next<CR>", "LSP go to next diagnostic" },
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "LSP open floating diagnostic"
    },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename"
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true}
      end,
      "LSP format"
    },
    ["<leader>pr"] = {
      function()
        local word = vim.fn.expand("<cword>")

        if word == nil or word == "" then
          print("No word under cursor")

          return
        end

        local opts = {
          prompt = "New name: ",
          default = word
        }

        local on_confirm = function(input)
          vim.cmd("Lspsaga project_replace " .. word .. " " .. input)
        end

        vim.ui.input(opts, on_confirm)
      end,
      "LSP project replace"
    },
  }

  local wk = require("which-key")

  wk.register(mappings, { buffer = bufnr })

  local visual = {
    name = "lsp",
    ["<leader>la"] = { "<Cmd>Lspsaga code_action<CR>", "LSP range code actions" },
  }

  wk.register(visual, { mode = "v", buffer = bufnr })
end

local basic_attach = function(client, bufnr)
  keymaps(client, bufnr)

  if client.server_capabilities.inlayHintProvider or vim.bo.ft == "dart" or vim.bo.ft == "cs" then
    vim.lsp.inlay_hint(bufnr, true)
  end
end

local lsp_attach = function(client, bufnr)
  on_attach(client, bufnr)
  basic_attach(client, bufnr)
end

return {
  keymaps = keymaps,
  on_attach = lsp_attach,
  basic_attach = basic_attach,
}
