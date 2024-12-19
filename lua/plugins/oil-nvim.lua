return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},

	config = function()
		require("oil").setup({
			columns = {
				"icon",
				-- "size",
				-- "mtime",
			},

			skip_confirm_for_simple_edits = true,
		})
	end,
}
