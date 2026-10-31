-- lua/plugins/oil.lua
-- ディレクトリをバッファとして開き、テキスト編集の感覚でファイル操作する
-- 編集後に :w で変更内容 (作成/削除/リネーム/移動) が確定する
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false, -- oil 公式の推奨 (遅延読み込みすると oil:// バッファの復元などが不安定になる)
  ---@module "oil"
  ---@type oil.SetupOpts
  opts = {
    -- ディレクトリを開いたときの担当は従来どおり neo-tree に任せる (oil は - で明示的に開く)
    default_file_explorer = false,
    -- 削除したファイルはゴミ箱へ (誤削除しても復元できる)
    delete_to_trash = true,
    view_options = {
      show_hidden = true, -- ドットファイルも表示 (g. で切り替え)
    },
    keymaps = {
      -- AstroNvim のウィンドウ移動 (Ctrl+h/l) と衝突するので無効化
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
      ["q"] = { "actions.close", mode = "n" },
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    -- :w したときの確認ポップアップを出さずに即反映する
    -- (skip_confirm_for_simple_edits は削除を含むと効かないので、確認処理自体を差し替える。
    --  delete_to_trash = true なので誤削除してもゴミ箱から戻せる)
    local confirmation = require("oil.mutator.confirmation")
    local orig_show = confirmation.show
    confirmation.show = function(actions, should_confirm, cb)
      if should_confirm == nil then should_confirm = false end
      return orig_show(actions, should_confirm, cb)
    end
  end,
  keys = {
    { "-", "<Cmd>Oil<CR>", desc = "Oil: 親ディレクトリを開く" },
    { "<Leader>O", function() require("oil").toggle_float() end, desc = "Oil: フロートで開く" },
  },
}
