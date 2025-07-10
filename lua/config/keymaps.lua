-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cP", function()
  local word = vim.fn.expand("<cword>")
  if word == "" then
    return
  end

  local filetype = vim.bo.filetype
  local log_line = ""

  if filetype:match("typescript") or filetype:match("javascript") then
    log_line = string.format("console.log('%s:', JSON.stringify(%s, null, 2));", word, word)
  elseif filetype == "go" then
    log_line = string.format('fmt.Printf("%%+v\\n", %s)', word)
  else
    log_line = string.format("console.log('%s:', %s);", word, word)
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, { log_line })
end, { desc = "Pretty console log under cursor (by filetype)" })
