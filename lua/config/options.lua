-- Options are automatically loaded before lazy.nvim startup
vim.opt.winbar = "%=%m %f"
vim.g.lazyvim_picker = "fzf"

local opt = vim.opt
opt.autowriteall = true -- Enable auto write

-- Wrap lines at 80 characters
vim.o.textwidth = 80
vim.o.wrap = true

-- Enable auto-reloading of files that have been modified externally
vim.o.autoread = true -- Automatically read files when changed externally
vim.o.scrolloff = 0
vim.o.smoothscroll = false
vim.g.snacks_animate = false
vim.g.lazyvim_cmp = "nvim-cmp"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4 -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4 -- Indentation amount for autoindents
vim.opt.expandtab = false -- Use tabs instead of spaces
vim.opt.smarttab = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "split"
vim.opt.scrolloff = 7

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md" }, -- Add your file types
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Configure diagnostics to use floating windows
vim.diagnostic.config({
  update_in_insert = true, -- Update diagnostics while typing
  underline = true,
  virtual_text = { spacing = 4, prefix = "●" },
  signs = true,
  severity_sort = true,
  float = {
    border = "rounded", -- Rounded corners for a clean look
    severity_sort = true, -- Sort the errors by severity (highest to lowest)
    max_width = 80, -- Set a maximum width for the floating window to avoid overflow
    max_height = 20, -- Set a maximum height to avoid the window becoming too large
  },
})

-- Automatically open floating diagnostics on cursor hold
vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })")

-- Keybinding to manually open diagnostics in a floating window
vim.keymap.set("n", "<leader>ud", vim.diagnostic.open_float, { desc = "Show diagnostics" })
