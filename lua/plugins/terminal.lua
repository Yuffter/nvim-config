-- lua/plugins/terminal.lua  (AstroNvim v5 / snacks.nvim 用)
-- フローティングターミナル。トグルで開閉でき、閉じてもプロセスは残る。
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    terminal = {
      win = {
        -- フローティング表示
        position = "float",
        border = "rounded",
        width = 0.8, -- 画面幅の80%
        height = 0.8, -- 画面高さの80%
        -- ターミナル内のキーマップ
        keys = {
          -- <Esc><Esc> でターミナルモードからノーマルモードへ
          term_normal = {
            "<esc><esc>",
            function() return "<C-\\><C-n>" end,
            mode = "t",
            expr = true,
            desc = "ノーマルモードへ",
          },
        },
      },
    },
  },
  keys = {
    -- 同じキーで開閉 (cwd ごとに別のターミナルを保持)
    -- Windows Terminal などでは Ctrl+/ が <C-_> として届くため両方割り当てる
    {
      "<C-/>",
      function() require("snacks").terminal.toggle(nil, { win = { position = "float" } }) end,
      mode = { "n", "t" },
      desc = "フローティングターミナル",
    },
    {
      "<C-_>",
      function() require("snacks").terminal.toggle(nil, { win = { position = "float" } }) end,
      mode = { "n", "t" },
      desc = "フローティングターミナル (<C-/> の別表現)",
    },
    -- 確実に届くキー: Alt+t
    {
      "<M-t>",
      function() require("snacks").terminal.toggle(nil, { win = { position = "float" } }) end,
      mode = { "n", "t" },
      desc = "フローティングターミナル (Alt+t)",
    },
    -- 別ターミナルを増やしたいとき (番号ごとに独立)
    {
      "<leader>t1",
      function() require("snacks").terminal.toggle(nil, { count = 1, win = { position = "float" } }) end,
      desc = "ターミナル 1",
    },
    {
      "<leader>t2",
      function() require("snacks").terminal.toggle(nil, { count = 2, win = { position = "float" } }) end,
      desc = "ターミナル 2",
    },
  },
}
