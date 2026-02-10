return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer", -- adds current buffer to dadbod
	},
	init = function()
		-- manually load .env
		local env_path = vim.fn.getcwd() .. "/.env"
		if vim.fn.filereadable(env_path) == 1 then
			local lines = vim.fn.readfile(env_path)
			for _, line in ipairs(lines) do
				local key, val = line:match("^([^=]+)=(.*)$")
				if key and val then
					-- Strip quotes if they exist
					val = val:gsub("^[\"']", ""):gsub("[\"']$", "")
					vim.fn.setenv(key, val)
				end
			end
		end

		-- put this into my .env file which has to be in the root of my project
		-- DB_URL_DEV_APP="oracle://app_user:strongpassword123@dev-host:1521/service_name"
		-- DB_URL_DEV_AUDIT="oracle://audit_user:anotherpassword@dev-host:1521/service_name"
		-- DB_URL_PROD="oracle://read_only:prodpassword@prod-host:1521/service_name"
		-- define DB connections
		vim.g.dbs = {
			pg_postgres = os.getenv("DB_URL_PG_POSTGRES"),
			-- Dev_App = os.getenv("DB_URL_DEV_APP"),
			-- Dev_Audit = os.getenv("DB_URL_DEV_AUDIT"),
			-- Prod_RO = os.getenv("DB_URL_PROD"),
		}

		-- UI Customization for easier switching
		vim.g.db_ui_show_database_navigation = 1
		-- This prevents the full URL from showing in the drawer
		vim.g.db_ui_use_short_outputs = 1
		-- I don't know if I actually want this
		--		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_winwidth = 40
	end,

	config = function()
		-- cmp.lua setup
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "mysql", "plsql" },
			callback = function()
				require("cmp").setup.buffer({
					sources = {
						{ name = "vim-dadbod-completion" },
						{ name = "buffer" },
					},
				})
			end,
		})
	end,
}
