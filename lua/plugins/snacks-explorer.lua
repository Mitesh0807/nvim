-- Snacks explorer configuration (replacing neo-tree)
return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          -- Focus on file list instead of search input
          focus = "list",
          hidden = true,
          exclude = { ".git" },
          git_status = true,
          git_untracked = true,
          diagnostics = true,
          follow_file = true,
          layout = {
            preview = "main",
            layout = {
              backdrop = false,
              width = 40,
              min_width = 40,
              height = 0,
              position = "right",
              border = "none",
              box = "vertical",
              {
                win = "input",
                height = 1,
                border = true,
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", border = "none" },
            },
          },
        },
      },
    },
  },
}
