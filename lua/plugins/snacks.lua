return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { exclude = { "*.meta", "Library/", "Temp/", "Logs/", "obj/", "node_modules/", "dist/", ".next/" } },
        grep = { exclude = { "*.meta", "Library/", "Temp/", "Logs/", "obj/", "node_modules/", "dist/", ".next/" } },
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

