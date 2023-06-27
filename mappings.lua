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

-- Custom mappings
M.custom = {
  n = {
    ["<leader>v"] = { "<C-v>", "Enter visual block mode" },
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
      "New horizontal term",
    },
    ["<C-z>"] = { "u", "Undo" },
    ["<C-y>"] = { "<C-r>", "Redo" },
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
    ["<leader>la"] = { vim.lsp.buf.code_action, "LSP code action" },
    ["<leader>sh"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
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
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic"
    },
  },
  i = {
    ["<C-z>"] = { "<C-o>u", "Undo" },
    ["<C-y>"] = { "<C-o><C-r>", "Redo" }
  },
  v = {
    [">"] = { ">gv", "Shift text right" },
    ["<"] = { "<gv", "Shift text left" },
    ["<Tab>"] = { ">gv", "Shift text right" },
    ["<S-Tab>"] = { "<gv", "Shift text left" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected block up" },
    ["<S-Down>"] = { ":m '>+1<CR>gv=gv", "Move selected block down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected block down" },
    ["<S-Up>"] = { ":m '<-2<CR>gv=gv", "Move selected block up" },
    ["<leader>c"] = { [["_c]], "Change without yanking content" },
    ["<leader>d"] = { [["_d]], "Delete without yanking content" },
  },
  x = {
    ["p"] = { [["_dP]], "Paste copied content and replace selection" },
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

-- more keybinds!
return M
