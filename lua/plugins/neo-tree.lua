return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    filesystem = {
      hijack_netrw = true,
      use_libuv_file_watcher = true,
      window = {
        width = 30,
      },
      on_attach = function(bufnr)
        -- Ensure the buffer is modifiable
        vim.bo[bufnr].modifiable = true
      end,
    },
  },
}

--24/12/2024
