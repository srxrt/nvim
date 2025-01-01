-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Add any additional options here
vim.opt.winbar = "%=%m %f"

-- Wrap lines at 80 characters
vim.o.textwidth = 80
vim.o.wrap = true

-- Enable auto-reloading of files that have been modified externally
vim.o.autoread = true -- Automatically read files when changed externally

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" }, -- Add your file types
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.opt.autoindent = true
vim.opt.smartindent = true
