return {
  { "echasnovski/mini.animate", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false, -- Disable animated command palette
        long_message_to_split = false, -- Prevent long messages from fading
      },
    },
  },
}
