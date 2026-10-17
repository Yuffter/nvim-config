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
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", cwd = false, indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
