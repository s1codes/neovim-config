plugins = {
	{
		"nvim-telescope/telescope.nvim", tag = '0.1.4',
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
	},
	{ 
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" 
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup {
				ensure_installed = { "lua", "go", "javascript", "vim", "vimdoc", "html", "css", "svelte" },
				sync_install = false, 
				highlight = { enabled = true },
				indent = { enable = true },
			}
		end
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
