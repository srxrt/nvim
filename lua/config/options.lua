-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Add any additional options here
vim.opt.winbar = "%=%m %f"

-- Wrap lines at 80 characters
vim.o.textwidth = 80
vim.o.wrap = true

-- Enable auto-reloading of files that have been modified externally
vim.o.autoread = true -- Automatically read files when changed externally
vim.o.scrolloff = 0
vim.o.smoothscroll = false

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" }, -- Add your file types
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Configure diagnostics to use floating windows
vim.diagnostic.config({
  virtual_text = false, -- Disable inline diagnostics (error hints next to the code)
  float = {
    border = "rounded", -- Rounded corners for a clean look
    source = "always", -- Show the source of the error (file/line information)
    severity_sort = true, -- Sort the errors by severity (highest to lowest)
    max_width = 80, -- Set a maximum width for the floating window to avoid overflow
    max_height = 20, -- Set a maximum height to avoid the window becoming too large
  },
})

-- Automatically open floating diagnostics on cursor hold
vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })")

-- Keybinding to manually open diagnostics in a floating window
vim.keymap.set("n", "<leader>ud", vim.diagnostic.open_float, { desc = "Show diagnostics" })
