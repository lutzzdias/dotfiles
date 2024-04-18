return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- imports
		local harpoon = require("harpoon")

		-- setup
		harpoon.setup()

		-- telescope
		local telescope_config = require("telescope.config").values
		local telescope_pickers = require("telescope.pickers")
		local telescope_finders = require("telescope.finders")

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			telescope_pickers
				.new({}, {
					prompt_title = "Harpoon",
					finder = telescope_finders.new_table({
						results = file_paths,
					}),
					previewer = telescope_config.file_previewer({}),
					sorter = telescope_config.generic_sorter({}),
				})
				:find()
		end

		-- keymaps
		local keymap = vim.keymap -- for conciseness
		local opts = { silent = true, noremap = true }

		opts.desc = "Add harpoon marker"
		keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, opts)

		opts.desc = "Toggle harpoon window"
		keymap.set("n", "<leader>hh", function()
			toggle_telescope(harpoon:list())
		end, opts)

		-- cycle through
		opts.desc = "Go to previous harpoon buffer"
		keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, opts)

		opts.desc = "Go to next harpoon buffer"
		keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, opts)

		-- go to
		opts.desc = "Go to harpoon buffer 1"
		keymap.set("n", "<leader>hq", function()
			harpoon:list():select(1)
		end, opts)

		opts.desc = "Go to harpoon buffer 2"
		keymap.set("n", "<leader>hw", function()
			harpoon:list():select(2)
		end, opts)

		opts.desc = "Go to harpoon buffer 3"
		keymap.set("n", "<leader>he", function()
			harpoon:list():select(3)
		end, opts)

		opts.desc = "Go to harpoon buffer 4"
		keymap.set("n", "<leader>hr", function()
			harpoon:list():select(4)
		end, opts)

		-- replace
		opts.desc = "Replace whats in harpoon buffer 1"
		keymap.set("n", "<leader>Hq", function()
			harpoon:list():replace_at(1)
		end, opts)

		opts.desc = "Replace whats in harpoon buffer 2"
		keymap.set("n", "<leader>Hw", function()
			harpoon:list():replace_at(2)
		end, opts)

		opts.desc = "Replace whats in harpoon buffer 3"
		keymap.set("n", "<leader>He", function()
			harpoon:list():replace_at(3)
		end, opts)

		opts.desc = "Replace whats in harpoon buffer 4"
		keymap.set("n", "<leader>Hr", function()
			harpoon:list():replace_at(4)
		end, opts)
	end,
}
