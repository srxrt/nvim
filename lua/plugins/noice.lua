return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      view = "cmdline_popup", -- Change to "cmdline_popup" for a floating position
    },
    views = {
      cmdline_popup = {
        size = {
          width = 60, -- Set width
          height = "auto",
        },
      },
    },
  },
}
