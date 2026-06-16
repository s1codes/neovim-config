local plugins = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "append",      -- ensure Mason's bin directory is in PATH
			})
		end,
	},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = { "saghen/blink.lib" },
		build = function()
			require("blink.cmp").build():pwait()
		end,
		opts = require("language-server.blink"),
	},
	{"nvim-tree/nvim-web-devicons"},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function ()
			require("nvim-treesitter").setup({
				ensure_installed = { "c", "lua", "vim", "javascript", "html", "go", "rust", "svelte", "json", "jsdoc", "typescript", "tsx" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim",
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
		config = function ()
			require("nvim-autopairs").setup {}
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function ()
			require('lualine').setup {
				options = {
					section_separators = { left = '', right = '' },
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
		"stevearc/oil.nvim",
		opts = {},
	},
}
return plugins
