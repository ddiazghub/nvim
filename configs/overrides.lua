local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "cpp",
    "python",
    "toml",
    "rust",
    "json"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust stuff
    "rust-analyzer",
    "rustfmt",
    "codelldb",

    -- python stuff
    "pyright",
    "mypy",
    "ruff",
    "black",
    "debugpy"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- Make powershell the default terminal
M.nvterm = {
  terminals = {
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  }
}

-- Autocompletion mappings
M.cmp = {
  [""] = require("cmp").mapping.complete
}

return M
