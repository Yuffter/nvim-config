return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark" -- "light" も可
    vim.g.everforest_background = "medium" -- "soft" / "medium" / "hard"
    vim.g.everforest_better_performance = 1
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_transparent_background = 2 -- 0: 透過なし / 1: 背景透過 / 2: ステータスライン等も透過
    vim.cmd.colorscheme "everforest"
  end,
}
