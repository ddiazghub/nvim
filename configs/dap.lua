local dap = require("dap")

--dap.configurations.python = {
--  {
--    -- The first three options are required by nvim-dap
--    type = "python"; -- the type here established the link to the adapter definition: `dap.adapters.python`
--    request = "launch";
--    name = "Debug file";
--
--    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--    program = "${file}"; -- This configuration will launch the current file if used.
--    pythonPath = function()
--      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--      local cwd = vim.fn.getcwd()
--      local venv_python = cwd .. "/venv/bin/python"
--
--      if vim.fn.executable(venv_python) then
--        return venv_python
--      end
--
--      venv_python = cwd .. "/.venv/bin/python"
--
--      if vim.fn.executable(venv_python) == 1 then
--        return venv_python
--      end
--
--      return os.getenv("LOCALAPPDATA") .. "\\Programs\\Python\\Python311\\python.exe"
--    end;
--  },
--}