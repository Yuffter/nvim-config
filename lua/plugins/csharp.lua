---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      handlers = {
        -- C# は roslyn.nvim を使うので omnisharp は起動しない（二重起動で重くなるため）
        omnisharp = false,
      },
    },
  },
}
