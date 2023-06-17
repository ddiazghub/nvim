---@type MappingsTable
local M = {}

-- Disabled
M.disabled = {
  n = {
      ["<leader>h"] = "",
      ["<leader>v"] = "",
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
      "<cmd> DapToggleBreakpoint <CR>",
      "toggle breakpoint"
    }
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
