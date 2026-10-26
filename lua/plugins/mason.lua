-- Customize Mason
---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- 関数で追加する(テーブルで書くと AstroCommunity の pack が追加したツールを上書きしてしまう)
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- language servers
        "lua-language-server",
        "pyright", -- Python
        "ruff", -- Python (lint + formatter)
        "tinymist", -- Typst
        "roslyn-language-server", -- C# (roslyn.nvim が自動検出する)
        -- formatters
        "stylua",
        "csharpier", -- C#
        "typstyle", -- Typst
        -- debuggers
        "debugpy",
        -- other
        "tree-sitter-cli",
      })
    end,
  },
}
