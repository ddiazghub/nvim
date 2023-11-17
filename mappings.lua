---@type MappingsTable
local M = {}

-- Disabled
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>b"] = "",
    ["<leader>ca"] = "",
    ["<leader>ch"] = "",
    ["<leader>cc"] = "",
    ["<leader>cm"] = "",
    ["<leader>f"] = "",
  }
}

-- Help
M.help = {
  n = {
    ["<leader>sh"] = { "<Cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
  }
}

-- LSP Mappings
M.lsp = {
  n = {
    K = { vim.lsp.buf.hover, "LSP Hover" },
    gd = { vim.lsp.buf.definition, "lsp goto definition" },
    gt = { vim.lsp.buf.type_definition, "lsp goto type definition" },
    gi = { vim.lsp.buf.implementation, "LSP goto implementation" },
    gr = { vim.lsp.buf.references, "LSP goto references" },
    gD = { vim.lsp.buf.declaration, "LSP goto declaration" },
    ["<leader>ld"] = { vim.lsp.buf.definition, "LSP peek definition" },
    ["<leader>lt"] = { vim.lsp.buf.type_definition, "LSP peek type definition" },
    ["<leader>li"] = { vim.lsp.buf.implementation, "LSP goto implementation" },
    ["<leader>la"] = { vim.lsp.buf.code_action, "LSP code actions" },
    ["[g"] = { vim.diagnostic.goto_prev, "LSP go to previous diagnostic" },
    ["]g"] = { vim.diagnostic.goto_next, "LSP go to next diagnostic" },
    ["<leader>lr"] = { vim.lsp.buf.rename, "LSP rename" },
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "LSP open floating diagnostic"
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true}
      end,
      "LSP format"
    },
  },
}

-- Mappings for spawning terminals
M.terminal = {
  n = {
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new("horizontal")
      end,
      "New horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new("vertical")
      end,
      "New vertical term",
    },
  }
}

-- Actions
M.actions = {
  n = {
    ["<leader>v"] = { "<C-v>", "Enter visual block mode" },
    ["<C-z>"] = { "u", "Undo" },
    ["<C-y>"] = { "<C-r>", "Redo" },
    ["<C-C>"] = { "<Cmd> %y <CR>", "Copy all lines in buffer" },
    ["<C-d>"] = { "<C-d>zz", "Half page jump down" },
    ["<C-u>"] = { "<C-u>zz", "Half page jump up" },
    ["<C-f>"] = { "<C-f>zz", "Page jump down" },
    ["<C-b>"] = { "<C-b>zz", "Page jump up" },
    ["<S-Down>"] = { "<C-d>zz", "Page jump down" },
    ["<S-Up>"] = { "<C-u>zz", "Page jump up" },
    ["n"] = { "nzzzv", "Seek next search term" },
    ["N"] = { "Nzzzv", "Seek next search term backwards" },
    ["<leader>c"] = { [["_c]], "Change without yanking content" },
    ["<leader>C"] = { [["_C]], "Change without yanking content" },
    ["<leader>de"] = { [["_d]], "Delete without yanking content" },
    ["<leader>D"] = { [["_D]], "Delete without yanking content" },
    ["<leader>rw"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace current word" },
    ["<C-k>"] = { "10k", "Fast scroll up" },
    ["<C-Up>"] = { "10k", "Fast scroll up" },
    ["<C-j>"] = { "10j", "Fast scroll down" },
    ["<C-Down>"] = { "10j", "Fast scroll down" },
    ["<C-h>"] = { "0", "Start of line" },
    ["<C-l>"] = { "$", "End of line" },
    ["<leader>jc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,
      "Jump to current context",
    },
  },
  i = {
    ["<C-z>"] = { "<C-o>u", "Undo" },
    ["<C-y>"] = { "<C-o><C-r>", "Redo" },
    ["<C-v>"] = { "<Esc>pi", "Paste" },
  },
  v = {
    [">"] = { ">gv", "Shift text right" },
    ["<"] = { "<gv", "Shift text left" },
    ["<Tab>"] = { ">gv", "Shift text right" },
    ["<S-Tab>"] = { "<gv", "Shift text left" },
    ["<leader>c"] = { [["_c]], "Change without yanking content" },
    ["<leader>d"] = { [["_d]], "Delete without yanking content" },
    ["<C-c>"] = { "y", "Copy selection" },
    ["<C-k>"] = { "10k", "Fast scroll up" },
    ["<C-j>"] = { "10j", "Fast scroll down" },
  },
  x = {
    p = { [["_dP]], "Paste copied content and replace selection" },
    ["C-v"] = { [["_dP]], "Paste copied content and replace selection" },
    ["<C-k>"] = { "10k", "Fast scroll up" },
    ["<C-j>"] = { "10j", "Fast scroll down" },
  }
}

-- Git related mappings
M.git = {
  n = {
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- Debugging key bindings
M.dap = {
  n = {
    ["<leader>db"] = {
      function()
        require("dap").continue()
      end,
      "Start debugger or continue to next breakpoint"
    },
    ["<leader>dt"] = {
      function()
        require("dap").terminate()
      end,
      "Terminate debugger"
    },
    ["<leader>dr"] = {
      function()
        require("dap").restart()
      end,
      "Restart debugger"
    },
    ["<leader>dl"] = {
      function()
        require("dap").list_breakpoints()
      end,
      "List breakpoints"
    },
    ["<leader>dc"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      "Clear breakpoints"
    },
    ["<leader>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle breakpoint"
    },
    ["<leader>ds"] = {
      function()
        vim.ui.input({ prompt = "Breakpoint condition > " }, function(condition)
          require("dap").set_breakpoint(condition)
        end)
      end,
      "Set conditional breakpoint"
    },
    ["<leader>dh"] = {
      function()
        require("dapui").toggle({ layout = 1, reset = true })
      end,
      "Toggle variables, scopes, stack frames and watches"
    },
    ["<leader>dj"] = {
      function()
        require("dapui").toggle({ layout = 2, reset = true })
      end,
      "Toggle Dap REPL and console"
    }
  }
}

-- Run test method in debugger
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end
    }
  }
}

-- Flutter tools, list flutter commands
M.flutter_tools = {
  plugin = true,
  n = {
    ["<leader>fc"] = {
      function()
        require("telescope").extensions.flutter.commands()
      end,
      "Flutter commands"
    }
  }
}

M.rest_nvim = {
  n = {
    ["<leader>rs"] = { "<Plug>RestNvim", "Run http request under cursor" },
  }
}

-- more keybinds!
return M
