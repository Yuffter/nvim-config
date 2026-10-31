return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_by_name = { "Library", "Temp", "Logs", "obj" },
        hide_by_pattern = { "*.meta" },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- oil などで展開中のフォルダを消すと、neo-tree の非同期スキャンが
    -- 「存在確認 → opendir」の間に消えたフォルダを開こうとして ENOENT を出す。
    -- 消えたフォルダは表示しないだけで実害はないので、そのエラー通知だけ握りつぶす。
    -- (log.error は setup 内の set_level で作り直されるので setup 後に差し替える)
    local log = require("neo-tree.log")
    local orig_error = log.error
    log.error = function(...)
      for i = 1, select("#", ...) do
        local arg = select(i, ...)
        if type(arg) == "string" and arg:find("ENOENT", 1, true) then return end
      end
      return orig_error(...)
    end
  end,
}
