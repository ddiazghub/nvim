local function get_shell()
  if vim.loop.os_uname().sysname == "Linux" then
    return vim.fn.executable("zsh") == 1 and "zsh" or "bash"
  else
    return vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  end
end

return {
  terminals = {
    shell = get_shell()
  }
}
