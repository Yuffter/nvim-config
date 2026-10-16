-- Python: pyright(型チェック・補完) + ruff(lint・フォーマット)
-- LSP の起動とフォーマット(保存時)は AstroLSP に任せる。インストールは mason.lua
---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.servers = require("astrocore").list_insert_unique(opts.servers, { "pyright", "ruff" })
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.treesitter = opts.treesitter or {}
      opts.treesitter.ensure_installed =
        require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, { "python", "lua" })
    end,
  },
}
