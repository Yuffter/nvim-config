vim.lsp.enable { "pyright", "ruff" }

return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = { ensure_installed = { "pyright", "ruff" } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install { "python", "lua" }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "lua" },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    opts = { keymap = { preset = "default" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { python = { "ruff_format" } },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
  },
}
