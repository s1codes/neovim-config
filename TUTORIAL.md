# Hands‑on Tutorial for the Minimal Neovim Config

Welcome! This setup gives you a modern, VS Code‑like editing experience while keeping external dependencies to a minimum.  
You get first‑class support for **Lua**, **C/C++**, **TypeScript / JavaScript / JSON**, **Go**, **Rust** and **Tailwind CSS** – all with blazing‑fast completion, fuzzy finding, and a beautiful interface.

## What’s inside?

- **Blink.cmp** – ultra‑fast completion with auto‑brackets and instant documentation.
- **Mason** – one‑click installation of language servers (`lua_ls`, `clangd`, `biome`, `tailwindcss`, `rust_analyzer`, `gopls`).
- **nvim‑treesitter** – precise syntax highlighting and indentation (includes Go, Rust, …).
- **Telescope** – fuzzy find files, grep live, browse buffers, and help tags.
- **Oil.nvim** – a modern file explorer you open with `-`.
- **nvim‑autopairs** – brackets and quotes close themselves.
- **Lualine** – beautiful status line showing mode, branch, diagnostics, date & time.
- **Onedark** – deep, eye‑friendly colour scheme.

## 1. Installing & first run

1. Copy the configuration files into your Neovim config directory (usually `~/.config/nvim`).
2. Launch Neovim:
   ```bash
   nvim
   ```
3. **Lazy.nvim** will download and install all plugins automatically.
4. Mason will then install the language servers `lua_ls`, `clangd`, `biome`, `tailwindcss`, `rust_analyzer` and `gopls` – you’ll see a message once they’re ready.

> **Note:** If you later want to add more language servers, run `:MasonInstall <server>` (e.g. `:MasonInstall pyright`).

## 2. Key mappings

The leader key is **space** (` `).

### Fuzzy finding (Telescope)

| Mapping          | Action                |
|------------------|-----------------------|
| `<leader>ff`    | Find files            |
| `<leader>fg`    | Live grep (search)    |
| `<leader>fb`    | List open buffers     |
| `<leader>fh`    | Search help tags      |

### Window navigation

| Mapping        | Action                      |
|----------------|-----------------------------|
| `Ctrl‑h`       | Move to the window on the **left**  |
| `Ctrl‑j`       | Move to the window **down**        |
| `Ctrl‑k`       | Move to the window **up**          |
| `Ctrl‑l`       | Move to the window on the **right**|

### File explorer

| Mapping | Action                         |
|---------|--------------------------------|
| `-`     | Open **Oil.nvim** in a floating window |

Oil replaces the default netrw explorer; it’s lightweight and respects your custom mappings.

### Completion (blink.cmp)

The defaults follow a well‑known style:

| Key            | Action                               |
|----------------|--------------------------------------|
| `Ctrl‑Space`   | Trigger completion manually          |
| `Ctrl‑b`       | Scroll documentation **up**          |
| `Ctrl‑f`       | Scroll documentation **down**        |
| `Ctrl‑e`       | Abort (close) completion popup       |
| `Enter`        | Confirm the selected item            |

## 3. LSP & completion in depth

Blink.cmp provides a single, unified completion menu showing:

- **LSP** suggestions (symbols, functions, etc.)
- **Path** completions (file system)
- **Snippets** (LSP snippet support)
- **Buffer** words

### Auto‑brackets

When you confirm a function or method, the matching parenthesis or bracket is added automatically (enabled by `accept.auto_brackets`).  
No extra plugin needed – it’s built right into the completion engine.

### Documentation pop‑up

Hover documentation for a completion item appears instantly (no key press required).  
If your cursor stays on an item for 200 ms, a floating window with the signature and description will be shown.

### Supported language servers

| Language / framework           | Server         | Managed by |
|--------------------------------|----------------|------------|
| Lua                            | `lua_ls`       | Mason      |
| C, C++, CUDA, ObjC             | `clangd`       | Mason      |
| TypeScript, JavaScript, JSON   | `biome`        | Mason      |
| HTML (via biome)               | `biome`        | Mason      |
| Tailwind CSS                   | `tailwindcss`  | Mason      |
| Rust                           | `rust_analyzer`| Mason      |
| Go                             | `gopls`        | Mason      |

To check which servers are active, run `:LspInfo`.  
If a server ever stops working, use `:LspRestart`.

## 4. Go support (via gopls)

Go support now works exactly like the other languages – **gopls** is installed and managed by Mason.  
When you open any `.go` file, `gopls` starts automatically and feeds completions, diagnostics, hover and go‑to‑definition through blink.cmp.

Common LSP commands work the same way:
- **Definition**: `gd`
- **References**: `gr`
- **Hover**: `K`
- **Rename**: `<leader>rn`
(These default key bindings are provided by Neovim’s built‑in LSP.)

## 5. Syntax highlighting & indentation

Tree-sitter parsers for **C, Lua, Vim, JavaScript, HTML, Go, Rust, Svelte, JSON, JSdoc, TypeScript and TSX** are installed automatically.  
Highlighting and indentation are **enabled by default** – no extra configuration needed.

You can add more parsers with `:TSInstall <language>` (e.g. `:TSInstall python`).

## 6. Eye candy & navigation tweaks

- **OneDark theme** – deep variant with a clean, warm look.
- **Lualine status line** displays:
  - Current mode (Normal, Insert, …)
  - Git branch, diff and LSP diagnostics
  - Filename
  - Encoding, file format, file type
  - Date & time (e.g. “Monday, 28 April 〣 10:30:45 AM”)
  - Cursor location
- **Auto‑pairs** – typing `(`, `[`, `{` or `"`, `'` automatically inserts the corresponding closing character when appropriate.

## 7. Customising further

Everything is built with *lazy.nvim* under the hood. The plugin list lives in `lua/lazysetup/plugins.lua`.  
Here are a few common tweaks:

- **Add a new LSP server:**  
  Append an entry to the `servers` table in `lua/language-server/init.lua` and add it to the `ensure_installed` list. Then run `:MasonInstall <server>`.
- **Change highlight colours** – edit the `onedark` setup block.  
- **Adjust auto‑brackets behaviour** – modify the `accept.auto_brackets` table in the `blink.cmp` opts.
- **Disable a plugin** – set `enabled = false` (or comment it out) in the plugin list.

If you mess something up, just delete `~/.local/share/nvim/lazy` and restart Neovim – the plugins will be reinstalled from scratch.

---

Enjoy your new editing environment! If you run into trouble, open an issue on the repository or refer to the documentation of the individual plugins.
