local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

local function set_mappings()
  vim.keymap.set("n", "s", dap.step_over, { noremap = true })
  vim.keymap.set("n", "S", dap.step_into, { noremap = true })
  vim.keymap.set("n", "o", dap.step_out, { noremap = true })
  vim.keymap.set("n", "c", dap.continue, { noremap = true })
  vim.keymap.set("n", "C", dap.reverse_continue, { noremap = true })
  vim.keymap.set("n", "O", dap.run_to_cursor, { noremap = true })
  vim.keymap.set("n", "b", dap.step_back, { noremap = true })
end

local function delete_mappings()
  vim.keymap.del("n", "s")
  vim.keymap.del("n", "S")
  vim.keymap.del("n", "o")
  vim.keymap.del("n", "c")
  vim.keymap.del("n", "C")
  vim.keymap.del("n", "O")
  vim.keymap.del("n", "b")
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  require("nvim-tree.api").tree.close()
  dapui.open()
  set_mappings()
  require("nvim-dap-virtual-text")
end

dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close()
  delete_mappings()
end

dap.listeners.after.event_exited["dapui_config"] = function()
  dapui.close()
  delete_mappings()
end

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "DapBreakpoint", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "󰜵", texthl = "DapStoppedText", linehl = "DapStopped", numhl = "" })
