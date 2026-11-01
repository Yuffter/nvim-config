-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.completion.blink-copilot" }, -- ← 修正
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.prettier" },
  { import = "astrocommunity.pack.eslint" },
  -- vscode-neovim で動かすときは VSCode と相性のよいプラグインだけ読み込む (ターミナルの Neovim には影響しない)
  { import = "astrocommunity.recipes.vscode" },
  -- import/override with your plugins folder
}