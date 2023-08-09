local on_attach = require("custom.lsp-defaults").on_attach

require("flutter-tools").setup {
  debugger = {
    enabled = true,
    exception_breakpoints = { "uncaught" },
    register_configurations = function(paths)
      local dap = require("dap")

      dap.adapters.dart = {
        type = "executable",
        command = paths.flutter_bin,
        args = { "debug-adapter" },
        options = {
          detached = false,
        },
      }

      dap.configurations.dart = {
        {
          name = "Debug App",
          request = "launch",
          type = "dart"
        },
        {
          name = "Debug App (profile mode)",
          request = "launch",
          type = "dart",
          flutterMode = "profile"
        },
        {
          name = "Debug App (release mode)",
          request = "launch",
          type = "dart",
          flutterMode = "release"
        }
      }
    end,
  },
  lsp = {
    on_attach = on_attach,
    settings = {
      completeFunctionCalls = true,
      analysisExcludedFolders = {
        vim.fn.expand '$HOME/.pub-cache',
        -- vim.fn.expand '$HOME/fvm/versions', -- flutter-tools should automatically exclude your SDK.
      }
    },
  }
}

require("telescope").load_extension("flutter")
require("core.utils").load_mappings("flutter_tools")
