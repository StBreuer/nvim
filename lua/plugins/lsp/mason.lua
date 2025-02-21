return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
   config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({})

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "marksman", --markdown 
  --"ltex", -- latex, markdown 
        --"tsserver", -- type script 
        "lua_ls",
        "pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "markdownlint-cli2", -- markdown linter
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "latexindent" --latex formatter
      }
    })
  end
}
