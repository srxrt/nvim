return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").lsp.on_attach(function(_, buffer)
        vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
        vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
      end)
    end,
  },
  opts = {
    servers = {
      tsserver = {},
    },
    setup = {
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
    },
  },
}
