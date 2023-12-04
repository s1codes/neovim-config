require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "tsserver", "html", "jsonls", "svelte", "rust_analyzer" },
})
require("language-server.cmp")

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function ()
	vim.api.nvim_buf_set_keymap(0, 'n', 'def', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(0, 'n', 'inf', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      staticcheck = true,
      gofumpt = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = util.root_pattern('.clangd','.clang-tidy','.clang-format','compile_commands.json','compile_flags.txt','configure.ac','.git'),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true,
  },
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  root_dir = util.find_git_ancestor,
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_dir = util.root_pattern("package.json", ".git")
}

lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml", "rust-project.json")
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}