vim.cmd('set inccommand=split') -- Show substitution in real time
vim.o.completeopt = "menuone,noselect"
vim.o.mouse = "a"
vim.o.scrolloff = 8
vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.undodir = "/Users/daniel/.config/nvim/undodir" -- Persist undo history

vim.o.undofile = true

vim.o.pyx = 3

vim.o.timeoutlen = 500 -- Show cheat sheet after this time (ms)

vim.o.hidden = true -- Allow hidden buffers

vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.shiftwidth = 4
vim.o.fileformat = 'unix'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.cursorline = true -- Change the background colour for the current line
vim.o.signcolumn = 'yes' -- Always show the gutter

vim.o.pumheight = 10 -- Pop up character height
vim.o.pumwidth = 15 -- Pop up character height
vim.o.pumblend = 10 -- Pop up transparency

vim.o.showmode = false -- Remove mode text

vim.o.autoread = true -- Reload buffers on disk file updates

-- Make line wraps more obvious
vim.cmd('set breakindent')
vim.cmd('set breakindentopt=shift:2')
vim.cmd('set showbreak=↳')

-- vim.cmd('let g:material_theme_style = "darker"')
-- vim.cmd('colorscheme material')

vim.opt.swapfile = false  -- Disable swap files because we have undo history
