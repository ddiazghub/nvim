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
