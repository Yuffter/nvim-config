-- lua/plugins/diffview.lua  (lazy.nvim / AstroNvim 用)
-- 差分・ファイル履歴・マージ衝突(3-way)解決
return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
  },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview: 差分を開く" },
    { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Diffview: 閉じる" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: このファイルの履歴" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: ブランチ全体の履歴" },
    {
      "<leader>gh",
      ":'<,'>DiffviewFileHistory<cr>",
      mode = "x",
      desc = "Diffview: 選択範囲の履歴",
    },
    {
      "<leader>gm",
      "<cmd>DiffviewOpen origin/main...HEAD<cr>",
      desc = "Diffview: origin/main との差分 (PR前確認)",
    },
  },
  opts = function()
    local actions = require "diffview.actions"
    return {
      enhanced_diff_hl = true, -- 差分のハイライトを見やすくする
      use_icons = true,
      view = {
        -- 通常の差分ビュー
        default = { layout = "diff2_horizontal" },
        -- マージ衝突: 左=OURS / 右=THEIRS / 下=結果 の 3-way
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = { layout = "diff2_horizontal" },
      },
      file_panel = {
        listing_style = "tree",
        win_config = { position = "left", width = 35 },
      },
      keymaps = {
        view = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "閉じる" } },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "閉じる" } },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "閉じる" } },
        },
        -- 衝突解決: ]x / [x で衝突箇所へ移動 (既定) + 採用キー
        -- 既定: <leader>co(OURS) <leader>ct(THEIRS) <leader>cb(BASE) <leader>ca(ALL) dx(削除)
        -- 大文字版 (<leader>CO など) はファイル全体に適用
        -- 詳細は diffview 内で g? を押すとヘルプが出る
        diff3 = {
          { { "n", "x" }, "<leader>co", actions.conflict_choose "ours", { desc = "OURS を採用" } },
          { { "n", "x" }, "<leader>ct", actions.conflict_choose "theirs", { desc = "THEIRS を採用" } },
          { { "n", "x" }, "<leader>cb", actions.conflict_choose "base", { desc = "BASE を採用" } },
          { { "n", "x" }, "<leader>ca", actions.conflict_choose "all", { desc = "全部を採用" } },
          { { "n", "x" }, "dx", actions.conflict_choose "none", { desc = "衝突箇所を削除" } },
        },
      },
    }
  end,
}
