require("lspsaga").setup {
  ui = {
    border = "rounded"
  },
  outline = {
    keys = {
      jump = "<CR>",
      quit = { "<Esc>", "q" }
    },
    layout = "float",
    max_height = 0.65
  },
  rename = {
    keys = {
      quit = { "<Esc>", "q" }
    }
  },
  definition = {
    keys = {
      quit = { "<Esc>", "q" }
    }
  },
  diagnostic = {
    max_height = 0.65,
    keys = {
      quit = { "<Esc>", "q" }
    }
  },
  finder = {
    default = "ref+imp+def",
    keys = {
      quit = { "<Esc>", "q" },
      toggle_or_open = { "o", "<CR>" }
    },
    left_width = 0.4,
    max_height = 0.6
  },
  code_action = {
    keys = {
      quit = { "<Esc>", "q" },
    }
  }
}
