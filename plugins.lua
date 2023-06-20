local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      "folke/neodev.nvim"
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  -- Override treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- Override nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Override nvterm
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Add completion to DAP buffers
  {
    "hrsh7th/nvim-cmp",
    opts = {
      enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
      end
    }
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
    end
  },

  -- Discord presence
  {
    "andweeb/presence.nvim",
    lazy = false,
    config = function()
      require("custom.configs.presence")
    end
  },

  -- Debugging adapter protocol
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("custom.configs.dap")
      require("core.utils").load_mappings("dap")
    end
  },

  -- Debugging ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function()
      require("custom.configs.dap-ui")
    end
  },

  -- Python debugging
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function(_, _)
      local path = os.getenv("LOCALAPPDATA") .. "\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end
  },

  -- Debugging completion
  {
    "rcarriga/cmp-dap",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = { { name = "dap" } },
      })
    end
  },

  -- Debugging virtual text
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }

    -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
