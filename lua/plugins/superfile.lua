-- lua/plugins/superfile.lua
return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local keymap = vim.keymap.set
      keymap("n", "<leader>sf", function()
        vim.cmd("split | terminal spf")
        vim.cmd("startinsert")
      end, { desc = "Open Superfile" })
    end,
  },
}
