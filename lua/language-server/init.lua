local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local on_attach = function ()
	print("LSP Attached")
end

local servers = {
	lua_ls = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		log_level = 2,
		root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
	},
	clangd = {
		cmd = { "clangd" },
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		root_dir = util.root_pattern('.clangd','.clang-tidy','.clang-format','compile_commands.json','compile_flags.txt','configure.ac','.git'),
	},
	biome = {},
	tailwindcss = {},
	rust_analyzer = {
		cmd = { 'rust-analyzer' },
		filetypes = { 'rust' },
	},
	gopls = {
		settings = {
			gopls = {
				completeUnimported = true,
				staticcheck = true,
				gofumpt = true,
				analyses = {
					unusedparams = true,
				},
			}
		}
	},
}

local handler = function(server_name)
	local server_opts = servers[server_name] or {}
	local capabilities = {}
	local ok, blink = pcall(require, "blink.cmp")
	if ok then
		capabilities = blink.get_lsp_capabilities()
	end
	local final_opts = vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
	}, server_opts)
	lspconfig[server_name].setup(final_opts)
end

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "biome", "tailwindcss", "rust_analyzer", "gopls" },
	handlers = { handler },
})
