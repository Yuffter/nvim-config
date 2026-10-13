-- Customize Mason
---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- language servers
        "lua-language-server",
        -- formatters
        "stylua",
        "csharpier", -- C#
        -- debuggers
        "debugpy",
        -- other
        "tree-sitter-cli",
      },
    },
  },
}