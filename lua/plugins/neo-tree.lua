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
}