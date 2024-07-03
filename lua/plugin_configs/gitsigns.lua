-- require('gitsigns').setup()
require('gitsigns').setup {
    signs = {
      add          = { text = '' },
      change       = { text = 'ﰣ'},
      delete       = { text = ''},
      topdelete    = { text = ''},
      changedelete = { text = ''},
    },
    numhl = false,
    linehl = false,
    -- keymaps = {
    --   -- Default keymap options
    --   noremap = true,
    --   buffer = true,
    -- },
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    sign_priority = 6,
    current_line_blame = Preferences.git.showInlineBlame,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = Preferences.git.inlineBlameDelay,
      ignore_whitespace = false,
    },

    update_debounce = 200,
    status_formatter = nil, -- Use default
  }

vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd'})
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn'})
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr'})

vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange'})
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr'})
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn'})

vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete'})
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr'})
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn'})
