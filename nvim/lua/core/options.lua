local opt = vim.opt -- for conciseness

-- general
opt.shell = "zsh" -- use zsh as shell
opt.title = true -- set title of window to file name
opt.timeoutlen = 500 -- time to wait for mapped sequence to complete (in milliseconds)
opt.updatetime = 1000 -- faster responsiveness (default is 4000)
opt.scrolloff = 10 -- keep 10 lines above and below cursor

-- line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = true -- show relative line numbers
opt.numberwidth = 1 -- show current and total line number in 'ruler'

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- appearance
opt.termguicolors = true -- turn on termguicolors
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.showtabline = 0 -- hide default tabline
opt.cursorline = true -- highlight current line
opt.colorcolumn = "80" -- highlight 80th column

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- config files
opt.swapfile = false -- turn off swapfile
opt.backup = false -- turn off backup file
opt.undofile = true -- use undo file
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo" -- set undo file path (nvim config root)
