require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
    ["a"] = "Actions",
    ["q"] = "Quit all",
    ["Q"] = "Quit",
    ["w"] = "Write",
    ["W"] = "Write (no auto cmd)",
    ["z"] = "Zen",
    ["e"] = "Explore",
    ["g"] = "Git",
    ["d"] = "Delete buffer",
    ["c"] = "Close split",
    ["C"] = {"<cmd>%bd!<cr>", "Clear session"},
    ["-"] = "Split below",
    ["|"] = "Split right",
    ["r"] = "Rename",
    ["f"] = "Format buffer",
    ["="] = "Balance windows",
    ["<ESC>"] = "No highlight",
    ["T"] = "Test",
    s = {
        name = "Search",
        c = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        f = {"<cmd>Telescope find_files<cr>", "Files"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        h = {"<cmd>Telescope help_tags<cr>", "Help"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man pages"},
        r = {"<cmd>Telescope registers<cr>", "Registers"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix list"},
        ["."] = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "This buffer"},
        b = {"<cmd>Telescope buffers<cr>", "Buffers"},
        v = {"<cmd>Telescope vim_options<cr>", "Vim options"}
    },
    t = {
        name = "Terminal",
        g = {"<cmd>lua _lazygit_toggle()<cr>", "Git"},
        d = {"<cmd>lua _lazydocker_toggle()<cr>", "Docker"},
    },
    o = {
        name = "Open",
        d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document diagnostics"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "Quickfix list"}
    },
    h = {
        name = "Hunk",
        n = {"<cmd>Gitsigns next_hunk<cr>", "Next"},
        p = {"<cmd>Gitsigns prev_hunk<cr>", "Previous"},
        P = {"<cmd>Gitsigns preview_hunk<cr>", "Preview"},
        s = {"<cmd>Gitsigns stage_hunk<cr>", "Stage"},
        S = {"<cmd>Gitsigns stage_hunk<cr>", "Select"},
        u = {"<cmd>Gitsigns undo_stage_hunk<cr>", "Undo"},
        q = {"<cmd>Gitsigns setqflist<cr>", "Quickfix list"}
    },
    y = {
        name = "Yank",
        p = {"<cmd>lua require('nvim-tree.api').tree.focus()<CR><cmd>lua require('nvim-tree.api').fs.copy.absolute_path()<CR><cmd>wincmd p<CR>","Path to file"}
    },
    d = {
        name = "Debugger",
        c = {"<cmd>DapContinue<cr>","Continue"},
        b = {"<cmd>DapToggleBreakpoint<cr>","Breakpoint"},
        n = {"<cmd>DapStepOver<cr>","Step next"},
        i = {"<cmd>DapStepInto<cr>","Step into"},
        o = {"<cmd>DapStepOut<cr>","Step out"},
        t = {"<cmd>lua require('neotest').run.run({strategy= 'dap'})<cr>","Debug nearest test"},
        q = {"<cmd>DapTerminate<cr>","Quit debug session"}
    }

}

-- Direct leader key binds
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua require("cosmic-ui").code_actions()<cr>', {noremap = true, silent= true}) -- Code Actions
vim.api.nvim_set_keymap('n', '<leader>T', '<cmd>lua require("neotest").run.run()<cr>', {noremap = true, silent= true}) -- Run nearest unit test

-- Lazygit toggle is defined in terminal.lua
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader><ESC>", "<cmd>nohl<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>qa<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>Q", "<cmd>q<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>w<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>W", "<cmd>noa w<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>|", "<cmd>vsplit<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>-", "<cmd>split<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>D", "<cmd>BufferDelete<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>close<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>BufferClose<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>tab split<CR>", {noremap = true, silent = true})

-- Other keybinds

-- Tab interferes with ctrl-i for jump list navigation
-- vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferNext<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>BufferNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>BufferPrevious<CR>", {noremap = true, silent = true})

-- Resize splits
vim.api.nvim_set_keymap("n", "<Down>", "<cmd>resize -2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Up>", "<cmd>resize +2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Left>", "<cmd>vertical resize -2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Right>", "<cmd>vertical resize +2<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>=", "<c-w>=", {noremap = true, silent = true})

-- Repeat in visual mode
vim.api.nvim_set_keymap("v", ".", ":'<,'>normal .<CR>", {noremap = true, silent = true})

local whichKey = require("which-key")
whichKey.register(mappings, opts)
