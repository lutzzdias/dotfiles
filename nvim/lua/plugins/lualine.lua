return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- imports
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				theme = "tokyonight",
				section_separators = { left = "", right = "" },
				always_divide_middle = false,
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"filename",
						path = 0, -- show only filename
						file_status = true, -- displays file status
						symbols = {
							modified = "", -- Text to show when the file is modified.
							readonly = "", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[No Name]", -- Text to show for unnamed buffers.
							newfile = "", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_c = {
					{
						"tabs",
						mode = 2, -- 2 = show tab name and tab number
						max_length = vim.o.columns * 2 / 3,
						use_mode_colors = true, -- update active tab color
						symbols = {
							modified = "",
						},
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
					},
					"filetype",
				},
				lualine_y = {
					"progress",
				},
				lualine_z = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
				},
			},
			inactive_sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1, -- relative path
						symbols = {
							modified = "", -- Text to show when the file is modified.
						},
					},
				},
				lualine_x = {},
			},
		})
	end,
}
