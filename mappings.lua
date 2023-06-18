---@type MappingsTable
local M = {}

-- Disabled
M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<leader>v"] = "",
      ["<leader>b"] = "",
  }
}

-- Custom mappings
M.custom = {
  n = {
    ["<leader>vb"] = { "<C-v>", "enter visual block mode" },
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
    }
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}



M.dap = {
  plugin = true,
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
        local condition = vim.ui.input({ prompt = "Breakpoint condition > " })
        require("dap").set_breakpoint(condition)
      end,
      "Set conditional breakpoint"
    },
  }
}

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
