---@type LazySpec
return {
  "kdheepak/lazygit.nvim",
  cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = { { "<Leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  init = function()
    vim.g.lazygit_floating_window_winblend = 20
  end,
}