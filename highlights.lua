-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    fg = "#606060"
  },

  Visual = {
    bg = "#303030"
  },

  IndentBlanklineContextStart = {
    bg = "#303030"
  },

  Character = {

  },

  Conditional = {
    fg = "#e06c75"
  },

  Boolean = {
    fg = "#56b6c2"
  },

  Constant = {
    fg = "#82aebf"
  },

  ["@constant"] = {
    fg = "#82aebf"
  },

  ["@constant.builtin"] = {
    fg = "#56b6c2"
  },

  Define = {
    fg = "#e06c75"
  },

  Delimiter = {
    fg = "#ffd709"
  },

  ["@punctuation.bracket"] = {
    fg = "#ffd709"
  },

  Float = {
    fg = "#c678dd"
  },

  Identifier = {
    fg = "#d19a66"
  },

  Variable = {
    fg = "#dddddd"
  },

  ["@parameter"] = {
    fg = "#d19a66"
  },

  ["@variable"] = {
    fg = "#dddddd"
  },

  ["@variable.builtin"] = {
    fg = "#56b6c2"
  },

  ["@property"] = {
    fg = "#d19a66"
  },

  ["@field"] = {
    fg = "#d19a66"
  },

  Function = {
    fg = "#98c379"
  },

  ["@function"] = {
    fg = "#98c379"
  },

  ["@function.call"] = {
    fg = "#98c379"
  },

  ["@method"] = {
    fg = "#98c379"
  },

  ["@method.call"] = {
    fg = "#98c379"
  },

  Include = {
    fg = "#e06c75"
  },

  Keyword = {
    fg = "#e06c75"
  },

  ["@keyword"] = {
    fg = "#e06c75"
  },

  ["@keyword.operator"] = {
    fg = "#e06c75"
  },

  ["@keyword.function"] = {
    fg = "#e06c75"
  },

  ["@keyword.return"] = {
    fg = "#e06c75"
  },

  Label = {
    fg = "#61afef"
  },

  Number = {
    fg = "#c678dd"
  },

  Operator = {
    fg = "#e06c75"
  },

  ["@operator"] = {
    fg = "#e06c75"
  },

  PreProc = {
  },

  Repeat = {
    fg = "#e06c75"
  },

  Special = {
    fg = "#abdbee"
  },

  SpecialChar = {
    fg = "#56b6c2"
  },

  -- Statement = {
  --   fg = theme.base08,
  -- },

  StorageClass = {
    fg = "#61afef"
  },

  String = {
    fg = "#e5c07b"
  },

  ["@string"] = {
    fg = "#e5c07b"
  },

  Structure = {
    fg = "#49a0e3"
  },

  -- Tag = {
  --   fg = theme.base0A,
  -- },

  -- Todo = {
  --   fg = theme.base0A,
  --   bg = theme.base01,
  -- },

  Type = {
    fg = "#49a0e3"
  },

  ["@type.builtin"] = {
    fg = "#49a0e3"
  },

  ["@constructor"] = {
    fg = "#49a0e3"
  },

  Typedef = {
    fg = "#e06c75"
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = {
    fg = "green",
    bold = true
  },

  DapBreakPoint = {
    bg = "#660000"
  },

  DapStopped = {
    bg = "#264d00"
  },

  DapStoppedText = {
    fg = "green"
  }
}

return M
