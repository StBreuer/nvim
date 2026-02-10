return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor" },
		-- { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			callback = function()
				vim.opt_local.number = false -- Disable absolute numbers (250)
				vim.opt_local.relativenumber = true -- Enable relative numbers (1, 2, 3...)
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					-- Optional: if you want to see files ignored by .gitignore,
					-- add: no_ignore = true
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
