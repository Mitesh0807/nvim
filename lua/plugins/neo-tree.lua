return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
    vim.keymap.set('n','<leader>n',':Neotree filesystem reveal float<CR>',{})
    -- want to open the tree on startup
    -- but on right side not left side just on startup
    vim.cmd('Neotree filesystem reveal right')
    -- now focus the tree on startup
    vim.cmd('Neotree focus')
    vim.g.neo_tree_remove_legacy_commands = 1
    -- leader e to get focus
    vim.keymap.set('n','<leader>e',':Neotree toggle<CR>',{})
  end,
}
