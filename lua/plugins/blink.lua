---@type LazySpec
return {
  "saghen/blink.cmp",
  -- AstroNvim のキー設定に加えて blink 標準のキー(<C-y> で確定など)も使う
  opts = { keymap = { preset = "default" } },
}
