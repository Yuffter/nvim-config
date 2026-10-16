-- Typst: ハイライト + LSP(tinymist) + プレビュー
-- LSP の起動とフォーマット(保存時、typstyle)は AstroLSP に任せる。インストールは mason.lua
---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.servers = require("astrocore").list_insert_unique(opts.servers, { "tinymist" })
      opts.config = opts.config or {}
      opts.config.tinymist = {
        settings = {
          formatterMode = "typstyle", -- フォーマッタ
          exportPdf = "onType", -- 入力のたびにPDF出力("onSave" でも可)
          semanticTokens = "disable", -- Treesitterのハイライトを優先
        },
      }
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.treesitter = opts.treesitter or {}
      opts.treesitter.ensure_installed =
        require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, { "typst" })
    end,
  },

  -- ブラウザでのリアルタイムプレビュー
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {},
    keys = {
      { "<leader>tp", "<cmd>TypstPreviewToggle<cr>", ft = "typst", desc = "Typst: プレビュー切替" },
    },
  },
}
