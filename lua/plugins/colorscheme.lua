return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- Load immediately
    priority = 1000, -- High priority to apply first
    opts = {
      flavor = "moch",
      transparent_background = true,
      styles = {
        comments = { "bold" },
      },
      interactions = {
        cmp = true,
        nvimtree = true,
        treesitter = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
  },
}
