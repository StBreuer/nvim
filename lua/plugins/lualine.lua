return {
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy", -- load after startup
    config = function()
      require("lualine").setup({
        options = { theme = 'catppuccin' },
      })
    end,
  }
}
