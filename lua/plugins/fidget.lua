-- ~/.config/nvim/lua/plugins/fidget.lua (lazy.nvim用)
return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    progress = {
      -- 進捗メッセージの更新間隔(ms)
      poll_rate = 100,
      -- 完了したメッセージを消すまでの時間(ms)
      ignore_done_already = false,
      ignore_empty_message = false,

      suppress_on_insert = false,

      display = {
        render_limit = 8, -- 同時に表示する最大数
        done_ttl = 5, -- 完了後に表示を残す秒数
        done_icon = "✔",
        done_style = "Constant",
        progress_ttl = math.huge, -- 進行中は消さない
        progress_icon = { pattern = "dots", period = 1 },
        -- 「Roslyn: Loading projects 45%」のように表示
        format_message = function(msg)
          local message = msg.message
          if not message then message = msg.done and "完了" or "処理中..." end
          if msg.percentage then message = string.format("%s (%.0f%%)", message, msg.percentage) end
          return message
        end,
      },

      lsp = {
        -- Roslyn系のクライアント名("roslyn" / "roslyn_ls")だけ別扱いしたい場合はここで調整
        progress_ringbuf_size = 0,
      },
    },

    notification = {
      window = {
        winblend = 0,
        border = "rounded",
        align = "bottom", -- 右下
      },
    },
  },
}
