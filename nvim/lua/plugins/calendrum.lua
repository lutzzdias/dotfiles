return {
	dir = "/Users/lutz/Developer/calendrum.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("calendrum").setup()
	end,
}
