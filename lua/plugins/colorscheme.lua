return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- Load immediately
    priority = 1000, -- High priority to apply first
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha") -- Change to desired Catppuccin variant
    end,
  },
}
