return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",  -- Lazy-load on entering insert mode
  dependencies = {
    "hrsh7th/cmp-buffer",      -- Source for text in buffers
    "hrsh7th/cmp-path",        -- Source for file system paths
    "L3MON4D3/LuaSnip",        -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Integration for autocompletion with snippets
    "rafamadriz/friendly-snippets", -- Useful predefined snippets
  },
  config = function()
    local cmp = require("cmp") -- Completion engine
    local luasnip = require("luasnip") -- Snippet engine

    -- Lazy-load VS Code-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noinsert"  -- Refined completion options
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expand snippets using LSP
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),  -- Previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(),  -- Next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),     -- Scroll docs up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),      -- Scroll docs down
        ["<C-Space>"] = cmp.mapping.complete(),      -- Trigger completion
        ["<C-e>"] = cmp.mapping.abort(),             -- Close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
      }),

      -- Autocompletion sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP completion source
        { name = "luasnip" },   -- Snippets
        { name = "buffer" },    -- Text within the current buffer
        { name = "path" },      -- Filesystem paths
      }),
    })
  end,
}
