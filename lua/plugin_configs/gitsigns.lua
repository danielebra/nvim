-- require('gitsigns').setup()
require('gitsigns').setup {
    signs = {
      -- TODO add hl to colorscheme
      -- add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      add          = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = 'ﰣ', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      -- change       = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      -- change       = {hl = 'GitSignsChange', text = 'O', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
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
    current_line_blame_formatter_opts = { relative_time = true },
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = Preferences.git.inlineBlameDelay,
      ignore_whitespace = false,
    },

    update_debounce = 200,
    status_formatter = nil, -- Use default
  }
