-- Set timeout for key sequences to 300ms
vim.o.timeoutlen = 300

-- Bind `kk` to exit Insert mode
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { desc = "Escape", noremap = true, silent = true })

-- Map keys to create new lines above or below the cursor
vim.keymap.set("n", "]<Space>", "m`o<Esc>``", { desc = "Add line below", silent = true })
vim.keymap.set("n", "[<Space>", "m`O<Esc>``", { desc = "Add line above", silent = true })

-- Kes to jump around panes in vim and tmux
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")

-- Bind l+l to create a new line below in insert mode
vim.keymap.set("i", "ll", "<Esc>o", { desc = "Insert new line below", noremap = true, silent = true })

--enable hidden files for grepping
vim.api.nvim_set_keymap(
  "n",
  "<leader>h",
  ":lua require('fzf-lua').files({ hidden = not require('fzf-lua').config().files.hidden })<CR>",
  { noremap = true, silent = true }
)
