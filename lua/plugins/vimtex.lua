return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "general"
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			build_dir = "build", -- keeps your .tex folder clean
			callback = 1,
			continuous = 1,
			executable = "latexmk",
			options = {
				"-pdf",
				"-interaction=nonstopmode",
				"-synctex=1",
			},
		}

		-- Map leader shortcuts (VimTeX already provides \ll, \lv, etc.)
		vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX" })
		vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" })
	end,
}
