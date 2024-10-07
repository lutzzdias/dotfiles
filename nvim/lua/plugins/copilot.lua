return {
	{
		"zbirenbaum/copilot.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local copilot = require("copilot")

			copilot.setup({
				suggestion = {
					auto_trigger = true,
					debouce = 50,
					keymap = {
						accept = "<S-TAB>",
					},
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken",
		config = function()
			local copilot_chat = require("CopilotChat")
			local copilot_select = require("CopilotChat.select")

			local prompts = {
				Explain = {
					mapping = "<leader>ae",
					description = "AI Explain",
				},
				Review = {
					mapping = "<leader>ar",
					description = "AI Review",
				},
				Tests = {
					mapping = "leader>at",
					description = "AI Tests",
				},
				Fix = {
					mapping = "<leader>af",
					description = "AI Fix",
				},
				Docs = {
					mapping = "<leader>ad",
					description = "AI Docs",
				},
				Commit = {
					prompt = "Write commit message for the change with conventional commits convention. Make sure the title has maximum 50 characters. Wrap the whole message in code block with language gitcommit.",
					mapping = "<leader>ac",
					description = "AI Commit",
				},
				CommitStaged = {
					prompt = "Write commit message for the change with conventional commits convention. Make sure the title has maximum 50 characters. Wrap the whole message in code block with language gitcommit.",
					mapping = "<leader>acs",
					description = "AI Commit Staged",
					selection = function(source)
						return copilot_select.gitdiff(source, true)
					end,
				},
				Refactor = {
					prompt = "Please refactor the following code to improve its clarity and readability.",
					mapping = "<leader>ai",
					description = "AI Refactor",
				},
			}

			copilot_chat.setup({
				question_header = "## User ",
				answer_header = "## Copilot ",
				error_header = "## Error ",
				auto_follow_cursor = false, -- Don't follow the cursor after getting response
				show_help = true, -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
				prompts = prompts,
				select = copilot_select.unnamed,
				mappings = {
					close = { normal = "q" },
					reset = { normal = "<C-x>" },
					submit_prompt = { normal = "<CR>" },
					accept_diff = { normal = "<C-y>" },
				},
			})

			-- keys
			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap

			opts.desc = "Copilot Chat - help actions"
			keymap.set("n", "<leader>ah", function()
				local actions = require("CopilotChat.actions")
				local telescope = require("CopilotChat.integrations.telescope")
				telescope.pick(actions.help_actions())
			end, opts)

			opts.desc = "Copilot Chat - prompt actions"
			keymap.set({ "n", "x" }, "<leader>ap", function()
				local actions = require("CopilotChat.actions")
				local telescope = require("CopilotChat.integrations.telescope")

				if vim.fn.mode() == "x" then
					telescope.pick(actions.prompt_actions({ selection = copilot_select.visual }))
				else
					telescope.pick(actions.prompt_actions())
				end
			end, opts)

			opts.desc = "Copilot Chat - custom prompt"
			keymap.set("n", "<leader>aq", function()
				local input = vim.fn.input("Ask Copilot: ")
				if input ~= "" then
					vim.cmd("CopilotChat " .. input)
				end
			end, opts)

			opts.desc = "Copilot Chat - current buffer"
			keymap.set("n", "<leader>ab", function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					copilot_chat.ask(input, { selection = copilot_select.buffer })
				end
			end, opts)
		end,
	},
}
