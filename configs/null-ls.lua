local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.deno_fmt, -- JS / TS formatting
  b.formatting.prettier.with { filetypes = { "html", "htmldjango", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- c - cpp
  b.formatting.clang_format,

  -- python
  b.diagnostics.mypy.with({
    extra_args = function()
      local venv = os.getenv("VIRTUAL_ENV")

      if venv then
        return { "--python-executable", venv .. "\\Scripts\\python.exe" }
      else
        return { "--python-executable", os.getenv("LOCALAPPDATA") .. "\\Programs\\Python\\Python311\\python.exe" }
      end
    end,
  }),

  b.diagnostics.ruff.with { extra_args = { "--ignore=E501" } },
  b.formatting.black,

  -- rust
  b.formatting.rustfmt
}

null_ls.setup {
  debug = true,
  sources = sources,
}
