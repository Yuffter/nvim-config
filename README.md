# Neovim Config (AstroNvim v6)

[AstroNvim](https://github.com/AstroNvim/AstroNvim) v6 をベースにした個人用 Neovim 設定です。

## 🛠️ インストール

### 既存設定のバックアップ

Windows (PowerShell):

```powershell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

Linux / macOS:

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### クローン

```shell
# Windows
git clone https://github.com/<your_user>/<your_repository> $env:LOCALAPPDATA\nvim
# Linux / macOS
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

### 起動

```shell
nvim
```

初回起動時に lazy.nvim がプラグインを、mason-tool-installer が LSP / フォーマッタ等を自動インストールします。

## 📦 主な構成

| 種類 | 内容 |
| --- | --- |
| AstroCommunity | Lua / TypeScript / JSON / HTML・CSS / Prettier / ESLint パック、blink-copilot、tokyonight、kanagawa |
| C# | `roslyn.nvim`（Roslyn LS）、omnisharp 設定、csharpier |
| Git | `lazygit.nvim`（`<Leader>gg`） |
| Markdown | `markdown-preview.nvim`（`:MarkdownPreview` / `:MarkdownPreviewToggle`） |
| Mason | lua-language-server, stylua, csharpier, debugpy, tree-sitter-cli |

## ⚠️ 追加セットアップ

### markdown-preview.nvim のビルド

markdown-preview.nvim はプレビュー用のバイナリ（Node アプリ）をビルドする必要があります。
初回インストール時に自動ビルドが失敗した場合や、`:MarkdownPreview` が動かない場合は、Neovim 内で以下を実行してください。

```vim
:Lazy build markdown-preview.nvim
```

実行後、Markdown ファイルを開いて `:MarkdownPreview` でブラウザにプレビューが表示されます（URL はコマンドラインにも表示されます）。

### Roslyn Language Server（C#）

`lua/plugins/roslyn.lua` は Roslyn LS を以下のパスから起動します。事前に配置しておいてください。

```
C:/tools/roslyn-ls/content/LanguageServer/win-x64/Microsoft.CodeAnalysis.LanguageServer.dll
```

`dotnet` コマンドに PATH が通っている必要があります。

### LazyGit

`<Leader>gg` を使うには [lazygit](https://github.com/jesseduffield/lazygit) 本体をインストールしておく必要があります。
