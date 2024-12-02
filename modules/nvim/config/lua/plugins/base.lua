-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight-night",
		},
	},
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.rust" },
	{ import = "lazyvim.plugins.extras.lang.zig" },
	{ import = "lazyvim.plugins.extras.lang.tailwind" },
	{ import = "lazyvim.plugins.extras.lang.terraform" },
	{ import = "lazyvim.plugins.extras.lang.svelte" },
	{ import = "lazyvim.plugins.extras.lang.gleam" },
	{ import = "lazyvim.plugins.extras.lang.clangd" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.python" },
	{ import = "lazyvim.plugins.extras.lang.java" },
	{ import = "lazyvim.plugins.extras.lang.toml" },
	{ import = "lazyvim.plugins.extras.coding.mini-surround" },
	{ import = "lazyvim.plugins.extras.coding.mini-comment" },
	{ import = "lazyvim.plugins.extras.editor.aerial" },
	{ import = "lazyvim.plugins.extras.editor.dial" },
	{ import = "lazyvim.plugins.extras.editor.refactoring" },
	{ import = "lazyvim.plugins.extras.editor.navic" },
	{ import = "lazyvim.plugins.extras.util.startuptime" },
	{ "rafamadriz/friendly-snippets", enabled = false },
	{
		"mrcjkb/rustaceanvim",
		ft = { "rust", "toml" },
		config = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							files = {
								excludeDirs = { ".direnv" },
							},
						},
					},
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "nix", "fish" } },
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				nix = { "alejandra", "injected" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nixd = {},
			},
			inlay_hints = {
				enabled = false,
			},
			diagnostics = {
				underline = true,
				virtual_text = false,
			},
		},
	},
	{
		"folke/noice.nvim",
		enabled = false,
	},
	{
		"nvim-cmp",
		dependencies = {
			-- {
			-- 	"supermaven-inc/supermaven-nvim",
			-- 	opts = {
			-- 		disable_inline_completion = true,
			-- 		disable_keymaps = true,
			-- 	},
			-- },
		},
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = "supermaven",
				group_index = 1,
				priority = 100,
			})
		end,
	},
	{
		"mg979/vim-visual-multi",
		lazy = false,
	},
	{
		"nvimdev/dashboard-nvim",
		opts = {
			config = {
				header = {
					"",
					"",
					"",
					"",
					"",
					"",
					"",
					"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					"⠀⠀⠀⠀⣠⣤⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					"⠀⠀⠀⣼⣿⣿⡿⠛⠛⠛⠛⠛⠛⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					"⠀⠀⣼⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠃⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀",
					"⠀⣸⣿⣿⠋⠹⣿⣿⣦⡀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣠⣿⣿⠃⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀",
					"⢠⣿⣿⣿⣷⣾⣿⣿⣿⣿⣆⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠈⢻⣿⣷⣄⠀⠀⠀⠀⠀",
					"⣿⣿⣿⠟⠛⠛⠛⠛⠛⢿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⡀⠀⠀⠀⠀⠀⠙⢿⣿⣷⡀⠀⠀⠀",
					"⠙⣿⣿⣧⡀⠀⠀⠀⠀⠀⠙⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣦⡀⠀⠀⠀⠀⠀⠻⣿⣿⣦⡀⠀",
					"⠀⠈⠻⣿⣿⣦⠀⠀⠀⠀⠀⠈⠻⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣄⠀⠀⠀⠀⠀⠈⢻⣿⣿⣄",
					"⠀⠀⠀⠈⢿⣿⣷⣄⠀⠀⠀⠀⠀⠈⢿⣿⣷⣄⠀⠀⠀⠀⠀⠀⢀⣀⣀⣽⣿⣿⣷⣤⣤⣤⣤⣤⣴⣿⣿⣿",
					"⠀⠀⠀⠀⠀⠙⢿⣿⣧⡀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⠃",
					"⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣦⡀⠀⠀⠀⢠⣿⣿⠋⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠈⠻⣿⣿⣧⣠⣿⣿⠏⠀",
					"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣷⣄⠀⢠⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⡟⠀⠀",
					"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣤⣤⣤⣤⣤⣤⣾⣿⣿⡟⠀⠀⠀",
					"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⠿⠿⠛⠋⠀⠀⠀⠀",
					"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					"",
					"",
					"",
					"",
					"",
					"",
				},
			},
		},
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({
				virtual_text = false,
			})
			vim.diagnostic.config({ virtual_lines = { only_current_line = true, highlight_whole_line = false } })
		end,
	},
	{
		"Wansmer/treesj",
		keys = { "<space>m" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
			{ "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
			{ "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Open file history" },
		},
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "openai",
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"laytan/cloak.nvim",
		opts = { enabled = true },
	},
}
