---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      "folke/neodev.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Telescope configuration
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "mkdir build && make",
    event = "BufReadPost",
    lazy = false,
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
  },

  -- Override plugin configs
  {
    "williamboman/mason.nvim",
    opts = require "custom.overrides.mason",
  },

  -- Override treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.overrides.treesitter",
  },

  -- Override nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.overrides.nvimtree",
  },

  -- Override nvterm
  {
    "NvChad/nvterm",
    opts = require "custom.overrides.nvterm",
  },

  -- Add completion to DAP buffers
  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.overrides.cmp",
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Neodev
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {}
    end,
  },

  -- Funny name SQL plugin
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- Dressing
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
  },

  -- LSP saga
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "custom.configs.lspsaga"
    end,
  },

  -- JSON and YAML schemas
  {
    "b0o/schemastore.nvim",
  },

  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "custom.configs.rust-tools"
    end,
  },

  -- Flutter tools
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require "custom.configs.flutter-tools"
    end,
  },

  -- Automatic tag closure
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "htmldjango",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- REST client
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },

  -- Debugging adapter protocol
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },

  -- Debugging ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "custom.configs.dap-ui"
    end,
  },

  -- Python debugging
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = os.getenv "LOCALAPPDATA" .. "\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },

  -- Debugging completion
  {
    "rcarriga/cmp-dap",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = { { name = "dap" } },
      })
    end,
  },

  -- Debugging virtual text
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup {}
    end,
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Firenvim browser extension (I'm already too far deep down the rabbit hole)
  {
    "glacambre/firenvim",
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = false,
    cond = not not vim.g.started_by_firenvim,
    build = function()
      require("lazy").load { plugins = "firenvim", wait = true }
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      require "custom.configs.firenvim"
    end,
  },

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
