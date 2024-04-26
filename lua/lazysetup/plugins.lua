local plugins = {
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/nvim-cmp"},
	{"L3MON4D3/LuaSnip"},
	{"saadparwaiz1/cmp_luasnip"},
	{"nvim-tree/nvim-web-devicons"},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "go", "svelte", "json", "jsdoc", "typescript" },
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
		"navarasu/onedark.nvim",
		config = function ()
			require("onedark").setup {
				style = "deep",
				cmp_itemkind_reverse = false,
			}
			require("onedark").load()
		end
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function ()
			require('lualine').setup {
				options = {
					section_separators = { left = '', right = '' },
					-- component_separators = { left = '', right = '' },
					component_separators = { left = ')', right = '(' },
					theme = 'onedark',
					icons_enabled = true,
				},
				sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch', 'diff', 'diagnostics'},
					lualine_c = {'filename'},
					lualine_x = {'encoding', 'fileformat', 'filetype'},
					lualine_y = {
						{
						  'datetime',
						  style = '%A, %d %B 〣 %I:%M:%S %p'
						}
					},
					lualine_z = {'location'}
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {'filename'},
					lualine_x = {'location'},
					lualine_y = {},
					lualine_z = {}
				},
			}
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		config = function ()
			require("nvim-tree").setup {}
		end
	},
}
return plugins
