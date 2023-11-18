local function get_shell()
  if vim.loop.os_uname().sysname == "Linux" then
    return "bash"
  else
    return vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  end
end

return {
  terminals = {
    shell = get_shell()
  }
}
