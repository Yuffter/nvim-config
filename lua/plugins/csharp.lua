---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      servers = { "omnisharp" },
      config = {
        omnisharp = {
          settings = {
            FormattingOptions = { EnableEditorConfigSupport = true },
            RoslynExtensionsOptions = {
              EnableAnalyzersSupport = false, -- 解析エンジンを一部無効化して軽量化
              EnableImportCompletion = false,
            },
          },
        },
      },
    },
  },
}