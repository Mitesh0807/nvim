-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

function _G.insert_console_log(json_format)
  -- Get selected text in visual mode
  local _, line_start, col_start = unpack(vim.fn.getpos("'<"))
  local _, line_end, col_end = unpack(vim.fn.getpos("'>"))

  -- Retrieve selected text
  local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
  if #lines == 0 then
    return
  end

  -- Extract the exact selection
  local selected_text = lines[1]:sub(col_start, col_end)

  if selected_text:sub(-1) == ";" then
    selected_text = selected_text:sub(1, -2)
  end
  -- Determine log format
  local log_statement
  if json_format then
    log_statement =
      string.format('console.log("Selected: %s =", JSON.stringify(%s, null, 2));', selected_text, selected_text)
  else
    log_statement = string.format('console.log("Selected: %s =", %s);', selected_text, selected_text)
  end

  -- Insert console.log statement in a new line
  vim.api.nvim_buf_set_lines(0, line_end, line_end, false, { log_statement })

  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end

-- Function to conditionally map keys
local function map_console_log_keys()
  local ft = vim.bo.filetype
  if ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
    vim.api.nvim_buf_set_keymap(
      0,
      "v",
      "<leader>cL",
      ":lua insert_console_log(false)<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "v",
      "<leader>cj",
      ":lua insert_console_log(true)<CR>",
      { noremap = true, silent = true }
    )
  end
end

-- Auto-command to set keymaps only for JS/TS files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = map_console_log_keys,
})
