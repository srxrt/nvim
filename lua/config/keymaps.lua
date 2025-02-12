-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keybinding for showing the hover tooltip
vim.api.nvim_set_keymap("n", "gh", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
-- Set timeout for key sequences to 300ms
vim.o.timeoutlen = 300
-- Bind `kk` to exit Insert mode
vim.api.nvim_set_keymap("i", "kk", "<Esc>", { noremap = true, silent = true })
--
-- Map keys to create new lines above or below the cursor
vim.api.nvim_set_keymap("n", "<leader>o", "o<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>O", "O<Esc>", { noremap = true, silent = true })

-- LazyVim configuration example for opening terminal
vim.api.nvim_set_keymap("n", "<leader>t", ":term<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")
--

-- Map to toggle wrapping with <Leader>cw
vim.api.nvim_set_keymap("n", "<Leader>cw", ":set wrap!<CR>", {
  noremap = true,
  silent = true,
})

-- Bind Shift+Enter to create a new line below in insert mode
vim.keymap.set("i", "<C-CR>", "<Esc>o", { desc = "Insert new line below", noremap = true, silent = true })
vim.keymap.set("n", "<C-CR>", "o<Esc>", { desc = "Insert new line below", noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader>uR",
  ":source $MYVIMRC<CR>",
  { desc = "Source neovim configuration changes", noremap = true, silent = true }
)

--enable hidden files for grepping
vim.api.nvim_set_keymap(
  "n",
  "<leader>h",
  ":lua require('fzf-lua').files({ hidden = not require('fzf-lua').config().files.hidden })<CR>",
  { noremap = true, silent = true }
)
