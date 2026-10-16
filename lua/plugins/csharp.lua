-- C#（Unity）: roslyn.nvim を使う
---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      handlers = {
        -- C# は roslyn.nvim を使うので omnisharp は起動しない（二重起動で重くなるため）
        omnisharp = false,
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    opts = {
      broad_search = false,
      lock_target = true,
      -- Neovim側のファイル監視を切り、roslyn自身に監視させる（WindowsでUnityのLibrary等を監視して重くなるのを防ぐ）
      filewatching = "roslyn",
    },
    config = function(_, opts)
      vim.lsp.config("roslyn", {
        cmd_env = {
          DOTNET_gcServer = "0",
          DOTNET_GCHeapHardLimitPercent = "14", -- 32GB × 14% ≒ 4.5GB
        },
        cmd = {
          "dotnet",
          "C:/tools/roslyn-ls/content/LanguageServer/win-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
          "--logLevel=Warning",
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
      -- CodeLens(参照数)はソリューション全体を走査し、BufEnter/InsertLeaveごとに更新されて重いので無効化
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "roslyn" then client.server_capabilities.codeLensProvider = nil end
        end,
      })
      require("roslyn").setup(opts)
    end,
  },
}
