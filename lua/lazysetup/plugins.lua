local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "go", "svelte" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.4',
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		opts = {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
				}
			}
		}
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
	},
	{
		"navarasu/onedark.nvim",
		config = function ()
			require("onedark").setup {
				style = "darker",
				cmp_itemkind_reverse = false,
			}
			require("onedark").load()
		end
	},
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/nvim-cmp"},
	{"L3MON4D3/LuaSnip"},
	{"saadparwaiz1/cmp_luasnip"},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
}
return plugins
