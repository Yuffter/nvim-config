local exclude = { "*.meta", "Library/", "Temp/", "Logs/", "obj/", "node_modules/", "dist/", ".next/" }

return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
  },
  opts = {
    picker = {
      sources = {
        files = { exclude = exclude },
        grep = { exclude = exclude },
        layout = { preset = "default" },
      },
    },
    dashboard = {
      preset = {
        header = [[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        -- ホーム画面上でそのキーを押すと実行される
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "f", desc = "Find File", action = function() Snacks.picker.smart() end },
          { icon = " ", key = "w", desc = "Find Word", action = function() Snacks.picker.grep() end },
          { icon = " ", key = "o", desc = "Recent Files", action = function() Snacks.picker.recent() end },
          { icon = " ", key = "s", desc = "Last Session", action = "<Leader>Sl" },
          { icon = "󰅲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Actions", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", cwd = false, indent = 2, padding = 1 },
        -- ショートカット早見表 (label は表示のみでキー割り当てはしない)
        {
          { icon = " ", title = "Shortcuts", indent = 2, padding = 1 },
          {
            indent = 2,
            padding = 1,
            { icon = " ", desc = "ホーム画面 (開く/閉じる)", label = "Space h" },
            { icon = " ", desc = "ファイル検索", label = "Space ff" },
            { icon = " ", desc = "文字列検索 (grep)", label = "Space fw" },
            { icon = " ", desc = "ファイルツリー", label = "Space e" },
            { icon = "󰏇 ", desc = "Oil (ファイル操作)", label = "-  Space O" },
            { icon = " ", desc = "ターミナル", label = "Ctrl+/  Alt+t" },
            { icon = " ", desc = "LazyGit", label = "Space gg" },
            { icon = " ", desc = "Diffview (差分)", label = "Space gv" },
            { icon = "󱐋 ", desc = "Flash ジャンプ", label = "Enter" },
            { icon = " ", desc = "参照一覧", label = "grr" },
            { icon = "󰅖 ", desc = "バッファを閉じる", label = "Space c" },
            { icon = " ", desc = "キーマップ検索", label = "Space fk" },
          },
        },
        { section = "startup" },
      },
    },
  },
}
