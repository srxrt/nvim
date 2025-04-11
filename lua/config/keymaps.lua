-- vim.api.nvim_set_keymap(
--   "n",
--   "gh",
--   ":lua vim.lsp.buf.hover()<CR>",
--   { desc = "Show tooltip", noremap = true, silent = true }
-- )
-- Set timeout for key sequences to 300ms
vim.o.timeoutlen = 300
-- Bind `kk` to exit Insert mode
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { desc = "Escape", noremap = true, silent = true })
--
-- Map keys to create new lines above or below the cursor

-- vim.api.nvim_set_keymap("n", "<leader>o", "o<Esc>", { desc = "Insert new line below", noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>O", "O<Esc>", { desc = "Insert new line above", noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")

-- Bind l+l to create a new line below in insert mode
vim.keymap.set("i", "ll", "<Esc>o", { desc = "Insert new line below", noremap = true, silent = true })

vim.keymap.set(
  "n",
  "<leader>ur",
  ":source ~/.config/nvim/init.lua",
  { desc = "Refresh Neovim Config", noremap = true, silent = true }
)

--enable hidden files for grepping
vim.api.nvim_set_keymap(
  "n",
  "<leader>h",
  ":lua require('fzf-lua').files({ hidden = not require('fzf-lua').config().files.hidden })<CR>",
  { noremap = true, silent = true }
)
