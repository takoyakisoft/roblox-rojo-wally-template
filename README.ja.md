[English](README.md) [日本語](README.ja.md)

![CI](https://github.com/takoyakisoft/roblox-rojo-wally-template/actions/workflows/ci.yml/badge.svg)

# これは何？

Roblox（Luau）でVSCodeを使ったモダンな開発環境のテンプレートです。

- VSCode 👉 Roblox Studioへの同期: [Rojo](https://github.com/rojo-rbx/rojo)
- リンター: [Selene](https://github.com/Kampfkarren/selene)
- フォーマッター: [StyLua](https://github.com/JohnnyMorganz/StyLua)
- パッケージマネージャー: [Wally](https://github.com/UpliftGames/wally)
- RojoとWallyのマネージャー:　[Rokit](https://github.com/rojo-rbx/rokit)
- CI/CD: [place-ci-cd-demo](https://github.com/Roblox/place-ci-cd-demo)

# インストール

> [!TIP]
> "Use this template"ボタンから使えます。

## Rokitのインストール

Windows (PowerShell)

```powershell
Invoke-RestMethod https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.ps1 | Invoke-Expression
```

macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.sh | sh
```

## RojoやWallyなどのインストール

```bash
rokit install
```

## パッケージのインストール

```bash
wally install
rojo sourcemap default.project.json --output sourcemap.json
wally-package-types -s sourcemap.json Packages/
wally-package-types -s sourcemap.json ServerPackages/
wally-package-types -s sourcemap.json DevPackages/
```

## VSCode拡張機能のインストール

このプロジェクトを開くとVSCodeで以下の拡張機能が表示されるのでインストールします。

- [Rojo](https://marketplace.visualstudio.com/items?itemName=evaera.vscode-rojo)
- [Luau Language Server](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp)
- [Selene](https://marketplace.visualstudio.com/items?itemName=Kampfkarren.selene-vscode)
- [StyLua](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.stylua)

# 使い方

## VSCodeからRojo

`Ctrl + Shift + P`

`Rojo: Open Menu`

> [!NOTE]
> 初めてならRoblox Studioを起動して、Install Roblox Studio Plugin

`▶ default.project.json`

## Roblox StudioからRojo

「プラグイン」タブ

「Rojo」リボン

「Connect」ボタン

## Wallyにパッケージを追加

`wally.toml`をVSCodeで編集します。

[wally.run](https://wally.run/)のサイトで欲しいパッケージを調べて「Install」でパッケージ名をコピーします。

各セクションの分類は

`[dependencies]`がReplicatedStorage(クライアントとサーバー)

`[server-dependencies]`がStarterPlayerScripts(サーバーでProfileStoreとCmdr用)

書き終えたら、再度[パッケージのインストール](#パッケージのインストール)を行います。

# テスト

このテンプレートは、[Lune](https://github.com/lune-org/lune) と [TestEZ](https://github.com/Roblox/testez) を使用したヘッドレス環境でのテストをサポートしています。

テスト環境では、CI上での動作を可能にするためにAIによって生成されたRoblox APIモック (`tests/roblox_mocks.luau`) を使用しています。これらのテストは主にロジックの確認を目的としており、ヘッドレス環境での基本的な動作検証を行うためのものです。

ローカルでテストを実行するには：

1. テスト用のプレイスをビルドします：
   ```bash
   rojo build default.project.json -o test.rbxl
   ```
2. テストスクリプトを実行します：
   ```bash
   lune run tests/run_tests.luau
   ```

# 参考

[How Big Studios Develop on Roblox](https://www.youtube.com/watch?v=IJDg6tRJmHo)
[【Roblox】VS Codeでの開発環境構築（Rokit + Rojo + Wally）【Cursor対応】](https://zenn.dev/ambr_inc/articles/15bef38a830a2e)
