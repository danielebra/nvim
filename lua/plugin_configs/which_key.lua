require("which-key").setup()

local mappingsV3 = {
    -- TOP LEVEL
    {"<leader>a", desc="Actions", '<cmd>lua require("cosmic-ui").code_actions()<cr>' },
    {"<leader>q", desc="Quit all", '<cmd>qa<cr>' },
    {"<leader>Q", desc="Quit", '<cmd>Q<cr>' },
    {"<leader>w", desc="Write", '<cmd>w<cr>' },
    {"<leader>W", desc="Write (no auto cmd)", '<cmd>noa w<cr>' },
    {"<leader>e", desc="Explore", '<cmd>NvimTreeToggle<cr>' },
    -- Lazygit toggle is defined in terminal.lua
    {"<leader>g", desc="Git", '<cmd>lua _lazygit_toggle()<cr>' },
    {"<leader>D", desc="Delete Buffer", '<cmd>BufferDelete<cr>' },
    {"<leader>c", desc="Close split", '<cmd>close<cr>' },
    {"<leader>C", desc="Clear session", '<cmd>%bd!<cr>' },
    {"<leader>|", desc="Split right", '<cmd>vsplit<cr>' },
    {"<leader>-", desc="Split below", '<cmd>split<cr>' },
    {"<leader>r", desc="Rename", },
    {"<leader>f", desc="Format buffer", '<cmd>lua vim.lsp.buf.format({async = true})<CR>' },
    {"<leader>=", desc="Balance windows", '<c-w>=' },
    {"<leader><ESC>", desc="No highlight", '<cmd>nohl<cr>' },
    {"<leader>T", desc="Test", '<cmd>lua require("neotest").run.run()<cr>' },
    {"<leader>z", desc="Zen", '<cmd>tab split<cr>' },
    {"<leader>l", group="LSP"},
    -- SEARCH
    {"<leader>s", group="Search"},
    {"<leader>sc", desc="Checkout branch", '<cmd>Telescope git_branches<cr>' },
    {"<leader>sf", desc="Files", "<cmd>Telescope find_files<cr>" },
    {"<leader>st", desc="Text", "<cmd>Telescope live_grep<cr>" },
    {"<leader>sT", desc="Text without tests", "<cmd>Telescope live_grep_args<CR>-g !**/*test* " },
    {"<leader>sh", desc="Help", "<cmd>Telescope help_tags<cr>" },
    {"<leader>sm", desc="Marks", "<cmd>Telescope marks<cr>" },
    {"<leader>sM", desc="Man pages", "<cmd>Telescope man_pages<cr>" },
    {"<leader>sr", desc="Registers", "<cmd>Telescope registers<cr>" },
    {"<leader>sq", desc="Quickfix list", "<cmd>Telescope quickfix<cr>" },
    {"<leader>s.", desc="This buffer", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
    {"<leader>sb", desc="Buffers", "<cmd>Telescope buffers<cr>" },
    {"<leader>sv", desc="Vim options", "<cmd>Telescope vim_options<cr>" },
    {"<leader>sw", desc="Word under cursor", "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>" },
    {"<leader>sW", desc="Word under cursor excluding tests", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '-g !**/*test* ' .. vim.fn.expand('<cword>') })<cr>" },
    -- TERMINAL
    {"<leader>t", group="Terminal"},
    {"<leader>tg", desc="Git", '<cmd>lua _lazygit_toggle()<cr>'},
    {"<leader>td", desc="Docker", '<cmd>lua _lazydocker_toggle()<cr>'},
    -- OPEN
    {"<leader>o", group="Open"},
    {"<leader>od", desc="Document diagnostics", '<cmd>Trouble diagnostics toggle filter.buf=0()<cr>'},
    {"<leader>oq", desc="Quickfix list", '<cmd>Trouble qflist toggle<cr>'},
    -- HUNK
    {"<leader>h", group="Hunk"},
    {"<leader>hn", desc="Next", "<cmd>Gitsigns next_hunk<cr>" },
    {"<leader>hp", desc="Previous", "<cmd>Gitsigns prev_hunk<cr>" },
    {"<leader>hP", desc="Preview", "<cmd>Gitsigns preview_hunk<cr>" },
    {"<leader>hs", desc="Stage", "<cmd>Gitsigns stage_hunk<cr>" },
    {"<leader>hS", desc="Select", "<cmd>Gitsigns stage_hunk<cr>" },
    {"<leader>hu", desc="Undo", "<cmd>Gitsigns undo_stage_hunk<cr>" },
    {"<leader>hq", desc="Quickfix list", "<cmd>Gitsigns setqflist<cr>" },
    -- YANK
    {"<leader>y", group="Yank"},
    {"<leader>yp", desc="Path to file", "<cmd>lua require('nvim-tree.api').tree.focus()<CR><cmd>lua require('nvim-tree.api').fs.copy.absolute_path()<CR><cmd>wincmd p<CR>"},
    -- DEBUGGER
    {"<leader>d", group="Debugger"},
    {"<leader>dc", desc="Continue", "<cmd>DapContinue<cr>"},
    {"<leader>db", desc="Breakpoint", "<cmd>DapToggleBreakpoint<cr>"},
    {"<leader>dn", desc="Step next", "<cmd>DapStepOver<cr>"},
    {"<leader>di", desc="Step into", "<cmd>DapStepInto<cr>"},
    {"<leader>do", desc="Step out", "<cmd>DapStepOut<cr>"},
    {"<leader>dt", desc="Debug nearest test", "<cmd>lua require('neotest').run.run({strategy= 'dap'})<cr>"},
    {"<leader>dq", desc="Quit debug session", "<cmd>DapTerminate<cr>"},

}

vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>BufferNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>BufferPrevious<CR>", {noremap = true, silent = true})

-- Resize splits
vim.api.nvim_set_keymap("n", "<Down>", "<cmd>resize -2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Up>", "<cmd>resize +2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Left>", "<cmd>vertical resize -2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Right>", "<cmd>vertical resize +2<CR>", {noremap = true, silent = true})

-- Repeat in visual mode
vim.api.nvim_set_keymap("v", ".", ":'<,'>normal .<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gF', ':vsp <cfile><CR>', { noremap = true, silent = true }) -- Open file under cursor in new buffer

local whichKey = require("which-key")
whichKey.add(mappingsV3)
