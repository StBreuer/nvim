return {
	-- Mason: LSP installer
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP Config
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Install servers
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
				},
				automatic_installation = true,
			})

			-- Enable LSP servers (reads from ~/.config/nvim/lsp/*.lua)
			vim.lsp.enable({
				"lua_ls",
				"rust_analyzer",
				"pyright",
			})

			-- Configure diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Diagnostic signs
			local signs = { Error = "✗ ", Warn = "⚠ ", Hint = "➤ ", Info = "ℹ " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- LSP keybindings on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", vim.lsp.buf.definition, "Goto Definition")
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")
					map("gr", vim.lsp.buf.references, "Goto References")
					map("gi", vim.lsp.buf.implementation, "Goto Implementation")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, "Format")
				end,
			})
		end,
	},
}
