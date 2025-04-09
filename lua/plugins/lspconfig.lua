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
    inlay_hints = { enabled = false },
    servers = {
      tsserver = {},
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      },
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
