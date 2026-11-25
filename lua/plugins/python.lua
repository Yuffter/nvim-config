-- Python: pyright(型チェック・補完) + ruff(lint・フォーマット)
-- LSP の起動とフォーマット(保存時)は AstroLSP に任せる。インストールは mason.lua

-- プロジェクトの仮想環境の python を探す (uv / venv が作る .venv を優先)
local function find_venv_python(root)
  if vim.env.VIRTUAL_ENV then return vim.env.VIRTUAL_ENV .. "/bin/python" end
  for _, dir in ipairs { root, vim.fn.getcwd() } do
    if dir then
      for _, name in ipairs { ".venv", "venv" } do
        local python = dir .. "/" .. name .. "/bin/python"
        if vim.fn.executable(python) == 1 then return python end
      end
    end
  end
end

---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.servers = require("astrocore").list_insert_unique(opts.servers, { "pyright", "ruff" })
      opts.config = opts.config or {}
      opts.config.pyright = vim.tbl_deep_extend("force", opts.config.pyright or {}, {
        -- uv add で入れたライブラリを pyright が見つけられるよう、.venv の python を使わせる
        before_init = function(_, config)
          local python = find_venv_python(config.root_dir)
          -- settings テーブルを差し替えると反映されないので、その場で書き換える
          if python and config.settings then
            config.settings.python = config.settings.python or {}
            config.settings.python.pythonPath = python
          end
        end,
      })
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.treesitter = opts.treesitter or {}
      opts.treesitter.ensure_installed =
        require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, { "python", "lua" })
    end,
  },
}
