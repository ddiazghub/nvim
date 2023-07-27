-- Make powershell the default terminal
return {
  terminals = {
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  }
}
