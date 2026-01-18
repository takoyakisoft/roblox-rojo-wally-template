# Luau Project Guidelines

## Overview

This project is built using native **Luau** for Roblox development. It utilizes a modern toolchain for package management, build automation, and testing.

- **Luau**: The programming language.
- **Wally**: Package manager.
- **Rokit**: Toolchain manager (manages Rojo, Lune, Selene, StyLua, etc.).
- **Rojo**: Syncs files between the filesystem and Roblox Studio.
- **Lune**: Standalone Luau runtime for task running and testing.
- **TestEZ**: Testing framework.

## Project Structure

- `src`: Source code root.
  - `src/ReplicatedStorage`: Shared code, modules, and packages (`Packages`, `DevPackages`).
  - `src/ServerScriptService`: Server-side logic and services.
  - `src/StarterPlayer/StarterPlayerScripts`: Client-side entry points (if applicable).
- `tests`: Lune scripts for running tests and mock configurations.
- `scripts`: Shell scripts for formatting, linting, and other utility tasks.
- `default.project.json`: Rojo project configuration.
- `wally.toml`: Wally dependency configuration.
- `rokit.toml`: Toolchain version configuration.

## Development Workflow

1.  **Setup Environment**:
    - Install tools: `rokit install`
    - Install dependencies: `wally install`

2.  **Start Development**:
    - Start Rojo sync: `rojo serve`
    - Connect the Rojo plugin in Roblox Studio to `localhost:34872`.

3.  **Code Quality**:
    - **Format**: `./scripts/shell/format.sh src` (uses StyLua)
    - **Lint**: `./scripts/shell/lint.sh src` (uses Selene)

4.  **Run Tests**:
    - **CI / Headless**:
      1. Build the place: `rojo build default.project.json -o test.rbxl`
      2. Run tests: `lune run tests/run_tests.luau`
      - Or use the wrapper script: `./scripts/shell/test.sh` (builds `test.rbxl` then runs `tests/run_tests.luau`).
    - **In Studio**: Press "Play" to run tests via `src/ServerScriptService/Dev/TestRunner.server.luau` (uses the real Roblox engine).

## Coding Standards

### Naming Conventions (Roblox Luau Style)

- **Files**: `PascalCase` for Modules/Classes (e.g., `GameManager.luau`), `camelCase` for utilities or services if preferred.
  - Test files: `ComponentName.spec.luau`.
- **Classes / Types**: `PascalCase`.
- **Functions / Methods / Variables**: `camelCase`.
- **Constants**: `UPPER_SNAKE_CASE` or `PascalCase`.
- **Private Members**: `_camelCase` (prefixed with underscore).

### Luau Best Practices

- **Strict Typing**: Use `--!strict` at the top of files whenever possible to enable strict type checking.
- **Services**: Use `game:GetService("ServiceName")`.
- **Packages**: Import packages from `ReplicatedStorage.Packages` (or `DevPackages`).

## Testing

- **Framework**: [TestEZ](https://github.com/Roblox/testez).
- **Location**: Co-locate test files with source files using the `.spec.luau` extension (e.g., `MathUtils.luau` -> `MathUtils.spec.luau`).
- **Execution**:
  - **Lune**: Uses `tests/roblox_mocks.luau` to simulate the Roblox API. Best for logic tests.
    - **Note**: `tests/roblox_mocks.luau` is **auto-generated**. Do not modify it manually. If you need to update mocks, edit `tests/command/generate_mocks_studio.luau` and run it in Roblox Studio to regenerate the file.
  - **Studio**: Best for tests requiring physics, DataStores, or complex engine features.
