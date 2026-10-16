-- lua/plugins/flash.lua  (lazy.nvim 用)
-- <CR> で検索ワードを入力 → 一致箇所すべてにラベル表示 → ラベルのキーでジャンプ
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    -- 現在のバッファ(ウィンドウ)内だけを対象にする
    modes = {
      search = {
        enabled = false, -- "/" 検索には干渉しない（使いたければ true）
      },
      char = {
        enabled = false, -- f/t/F/T には干渉しない
      },
    },
    label = {
      -- 一致箇所の前側にラベルを表示
      after = false,
      before = true,
      -- 大文字ラベルも使う（一致が多いときに候補が増える）
      uppercase = true,
    },
    highlight = {
      -- 一致箇所をバッファ全体で色付けする
      backdrop = true,
      matches = true,
    },
    jump = {
      -- ジャンプ履歴(<C-o>で戻れる)に残す
      jumplist = true,
      -- ジャンプ後に検索ハイライトを消す
      nohlsearch = true,
    },
  },
  keys = {
    {
      "<CR>",
      mode = { "n", "x", "o" },
      function() require("flash").jump() end,
      desc = "Flash: 検索してラベルでジャンプ",
    },
    -- 補助: 構文木(Treesitter)ベースの選択
    {
      "<leader>ft",
      mode = { "n", "x", "o" },
      function() require("flash").treesitter() end,
      desc = "Flash: Treesitter",
    },
  },
}
