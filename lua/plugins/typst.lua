-- lua/plugins/typst.lua
-- lazy.nvim 用の Typst 設定(ハイライト + LSP + プレビュー + フォーマッタ)

return {
  -- Treesitter(シンタックスハイライト)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if type(opts.ensure_installed) == "table" then table.insert(opts.ensure_installed, "typst") end
    end,
  },

  -- Mason(tinymist と typstyle を自動インストール)
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "tinymist", "typstyle" })
    end,
  },

  -- LSP(tinymist)
  {
    "neovim/nvim-lspconfig",
    ft = "typst",
    config = function()
      local settings = {
        formatterMode = "typstyle", -- フォーマッタ
        exportPdf = "onType", -- 入力のたびにPDF出力("onSave" でも可)
        semanticTokens = "disable", -- Treesitterのハイライトを優先
      }

      if vim.lsp.config then
        -- Neovim 0.11 以降
        vim.lsp.config("tinymist", { settings = settings })
        vim.lsp.enable "tinymist"
      else
        -- Neovim 0.10 以前
        require("lspconfig").tinymist.setup { settings = settings }
      end
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

  -- フォーマッタ(conform.nvim)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typst = { "typstyle" },
      },
    },
  },
}
