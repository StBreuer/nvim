return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",

	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		-- see below for full list of optional dependencies
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/projects/brain/",
			},
		},
		mappings = {
			-- toggle between " " and "x"
			["<leader>x"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox({ "x", " " })
				end,
				opts = { buffer = true },
			},
			-- toggle between " " and "?"
			["<leader>?"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox({ "?", " " })
				end,
				opts = { buffer = true },
			},
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		-- keymap mappings
		vim.keymap.set("n", "<leader>cj", function()
			-- 1. Prompt the user for input
			local entered_number = vim.fn.input("Enter journal number: ")

			-- 2. Check if the user cancelled (pressed <CR> with no input)
			if entered_number == nil or entered_number == "" then
				vim.cmd("ObsidianToday 0")
			end

			-- 3. Build the command string and execute it
			local command_to_run = string.format("ObsidianToday %s", entered_number)
			vim.cmd(command_to_run)
		end, { desc = "Obsidian: New Journal from Template" }),
		--backlinks
		vim.keymap.set("n", "<leader>b", "<cmd>ObsidianBacklinks<CR>", { desc = "opens picker with backlinks" }),

		daily_notes = {
			folder = "journal",
			date_format = "%a-%d-%m-%Y",
			default_tags = { "journal" },
			template = "journal.md",
		},

		templates = {
			folder = "templates",
			date_format = "%a-%d-%m-%Y",
			time_format = "%H:%M",
		},
	},
}
