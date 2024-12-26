return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  config = function()
    require("persistence").setup({
      dir = vim.fn.stdpath("state") .. "/sessions/", -- Directory where sessions are saved
      options = { "buffers", "curdir", "tabpages", "winsize", "folds" }, -- Options to save
    })
  end,
}
