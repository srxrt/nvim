-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.env" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })
--
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "dotenv" },
  callback = function()
    vim.b.autoformat = false
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
