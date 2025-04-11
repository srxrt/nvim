return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>uo", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    outline_window = {
      width = 10,
      relative_width = true,
    },
  },
}
