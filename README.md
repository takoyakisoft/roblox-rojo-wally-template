[English](README.md) [日本語](README.ja.md)

# What is this?

This is a template for a modern development environment for Roblox (Luau) using VSCode.

- VSCode 👉 Roblox Studio Sync: [Rojo](https://github.com/rojo-rbx/rojo)
- Linter: [Selene](https://github.com/Kampfkarren/selene)
- Formatter: [StyLua](https://github.com/JohnnyMorganz/StyLua)
- Package Manager: [Wally](https://github.com/UpliftGames/wally)
- Manager for Rojo and Wally: [Rokit](https://github.com/rojo-rbx/rokit)

> [!WARNING]
> CI/CD is not included: [CI/CD](https://github.com/Roblox/place-ci-cd-demo)

# Installation

> [!TIP]
> You can use this via the "Use this template" button.

## Installing Rokit

Windows (PowerShell)

```powershell
Invoke-RestMethod https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.ps1 | Invoke-Expression
```

macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.sh | sh
```

## Installing Rojo, Wally, etc.

```bash
rokit install
```

## Installing Packages

```bash
wally install
rojo sourcemap default.project.json --output sourcemap.json
wally-package-types -s sourcemap.json Packages/
wally-package-types -s sourcemap.json ServerPackages/
```

## Installing VSCode Extensions

When you open this project in VSCode, you will be prompted to install the following recommended extensions. Please install them.

- [Rojo](https://marketplace.visualstudio.com/items?itemName=evaera.vscode-rojo)
- [Luau Language Server](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp)
- [Selene](https://marketplace.visualstudio.com/items?itemName=Kampfkarren.selene-vscode)
- [StyLua](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.stylua)

# Usage

## Rojo from VSCode

Press `Ctrl + Shift + P`

Select `Rojo: Open Menu`

> [!NOTE]
> If this is your first time, launch Roblox Studio and install the Roblox Studio Plugin.

Select `▶ default.project.json`


## Rojo from Roblox Studio

Go to the "Plugins" tab.

In the "Rojo" ribbon, click the "Connect" button.

## Adding Packages with Wally

Edit `wally.toml` in VSCode.

Find the package you want on [wally.run](https://wally.run/) and copy its name from the "Install" section.

The sections are categorized as follows:

`[dependencies]` is ReplicatedStorage (client and server)

`[server-dependencies]` is StarterPlayerScripts (for ProfileStore and Cmdr on the server)

Once you've finished editing, run the [package installation](#installing-packages) steps again.

# References

[How Big Studios Develop on Roblox](https://www.youtube.com/watch?v=IJDg6tRJmHo)
[[Roblox] Building a development environment with VS Code (Rokit + Rojo + Wally) [Cursor support]](https://zenn.dev/ambr_inc/articles/15bef38a830a2e)
