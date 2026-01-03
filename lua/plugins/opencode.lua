return {
  {
    "NickvanDyke/opencode.nvim",
    lazy = false,
    config = function()
      vim.g.opencode_opts = {}
      vim.o.autoread = true
    end,
    keys = {
      {
        "<leader>oa",
        function()
          require("opencode").ask("@this: ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "Ask opencode",
      },
      {
        "<leader>os",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "Execute opencode action",
      },
      {
        "<leader>ot",
        function()
          require("opencode").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle opencode",
      },

      {
        "<leader>oo",
        function()
          return require("opencode").operator("@this ")
        end,
        mode = { "n", "x" },
        expr = true,
        desc = "Add range to opencode",
      },
      {
        "<leader>ol",
        function()
          return require("opencode").operator("@this ") .. "_"
        end,
        mode = "n",
        expr = true,
        desc = "Add line to opencode",
      },

      {
        "<leader>ou",
        function()
          require("opencode").command("session.half.page.up")
        end,
        mode = "n",
        desc = "Opencode half page up",
      },
      {
        "<leader>od",
        function()
          require("opencode").command("session.half.page.down")
        end,
        mode = "n",
        desc = "Opencode half page down",
      },

      {
        "<leader>on",
        function()
          require("opencode").command("session.new")
        end,
        mode = "n",
        desc = "New opencode session",
      },
      {
        "<leader>oi",
        function()
          require("opencode").command("session.interrupt")
        end,
        mode = "n",
        desc = "Interrupt opencode session",
      },
      {
        "<leader>oc",
        function()
          require("opencode").command("session.compact")
        end,
        mode = "n",
        desc = "Compact opencode session",
      },
      {
        "<leader>oz",
        function()
          require("opencode").command("session.undo")
        end,
        mode = "n",
        desc = "Opencode undo",
      },
      {
        "<leader>or",
        function()
          require("opencode").command("session.redo")
        end,
        mode = "n",
        desc = "Opencode redo",
      },

      {
        "<leader>og",
        function()
          require("opencode").command("agent.cycle")
        end,
        mode = "n",
        desc = "Cycle opencode agent",
      },
    },
  },
}
