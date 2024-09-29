return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            hidden = "hidden",
          },
        },
        files = {
          cmd = "rg --files --hidden --glob '!{.git/*,.next/*,.svelte-kit/*,target/*,node_modules/*}'"
        },
      })
    end,
  },
}