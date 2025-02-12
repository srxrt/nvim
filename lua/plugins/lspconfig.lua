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
        -- Disable inlay hints for TypeScript
        opts.on_attach = function(client, bufnr)
          -- Disable inlay hints
          client.server_capabilities.inlayHintProvider = false

          -- Additional on_attach configurations
          require("lazyvim.util").lsp.on_attach(client, bufnr)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = bufnr, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { buffer = bufnr, desc = "Rename File" })
        end

        require("typescript").setup({ server = opts })
        return true
      end,
    },
  },
}
