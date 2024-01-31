return {
	"hedyhli/markdown-toc.nvim",
	ft = "markdown", -- lazy load on markdown filetype
	config = function()
		-- imports
		local mtoc = require("mtoc")

		-- config
		mtoc.setup({
			fences = {
				start_text = "start table of contents",
				end_text = "end table of contents",
			},

			toc_list = {
				indent_size = vim.bo.shiftwidth,
			},
		})

		-- keymaps
		-- defined in ftplugin/markdown.lua
	end,
}
