-- HTML: ハイライト・LSP(html / cssls / emmet)・フォーマット(prettier)は community.lua の pack に任せる
-- ここではブラウザでのライブプレビューだけを追加する(Node.js などの外部依存なし)
---@type LazySpec
return {
  {
    "brianhuster/live-preview.nvim",
    cmd = "LivePreview",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { "<leader>tp", "<cmd>LivePreview start<cr>", ft = { "html", "css", "javascript" }, desc = "HTML: プレビュー開始" },
      { "<leader>tP", "<cmd>LivePreview close<cr>", ft = { "html", "css", "javascript" }, desc = "HTML: プレビュー停止" },
    },
    config = function()
      require("livepreview.config").set {
        port = 5500,
        browser = "default", -- OS の既定ブラウザで開く
        dynamic_root = false, -- cwd をルートにする(相対パスの css / js / 画像を読めるように)
        sync_scroll = true, -- エディタのスクロールにブラウザを追従させる
        picker = "snacks.picker", -- :LivePreview pick で使うピッカー
      }
    end,
  },
}
