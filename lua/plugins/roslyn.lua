return {
  "seblyng/roslyn.nvim",
  ft = { "cs" },
  opts = {
    broad_search = false,
    lock_target = true,
  },
  config = function(_, opts)
    vim.lsp.config("roslyn", {
      cmd_env = {
        DOTNET_gcServer = "0",
        DOTNET_gcConcurrent = "0",
        DOTNET_GCHeapHardLimitPercent = "14", -- 32GB × 14% ≒ 4.5GB
      },
      cmd = {
        "dotnet",
        "C:/tools/roslyn-ls/content/LanguageServer/win-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
        "--logLevel=Information",
        "--extensionLogDirectory=" .. vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
        "--stdio",
      },
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|completion"] = {
          dotnet_show_completion_items_from_unimported_namespaces = true,
          dotnet_show_name_completion_suggestions = true,
        },
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "openFiles",
          dotnet_compiler_diagnostics_scope = "openFiles",
        },
      },
    })
    require("roslyn").setup(opts)
  end,
}