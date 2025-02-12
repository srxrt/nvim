-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vivim.api.nvim_create_autocmdm.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.env" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "dotenv" },
  callback = function()
    vim.b.autoformat = false
  end,
})

--dsfsfs
-- AutoSaveOnFocusLost
local group = vim.api.nvim_create_augroup("AutoSaveOnFocusLost", { clear = true })
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  group = group,
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.filetype ~= "neo-tree" then
      vim.cmd("silent! write")
    end
  end,
})

-- autosave session
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    require("persistence").save()
  end,
})

-- load last session
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
  callback = function()
    if vim.fn.getcwd() ~= vim.env.HOME then
      require("persistence").load()
    end
  end,
  nested = true,
})
