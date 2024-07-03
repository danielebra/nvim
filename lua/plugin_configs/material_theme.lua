local material = require 'material'
local colors = require 'material.colors'

material.setup{
    custom_colors = function(colors)
      -- Confirmed
      colors.syntax.comments = Preferences.designSystem.palette.lightGray
      colors.syntax.variable = "white"
      colors.syntax.type = Preferences.designSystem.palette.yellow  -- Class names
      colors.syntax.keyword = Preferences.designSystem.palette.lightBlue -- for, if, else
      -- colors.syntax.keyword = Preferences.designSystem.palette.lightBlue
      colors.syntax.operator = Preferences.designSystem.palette.lightBlue
      -- Not sure
      colors.syntax.value = Preferences.designSystem.palette.darkGray  -- Numbers?
      -- Experimenting
      colors.syntax.field = "red"
      -- Known TODOs:
      -- class/def/self/if/else is cyan but should be purple
      --
      -- Good to know, but we use the default
      -- colors.syntax.fn -- Function names
    end,
    custom_highlights = {
      LineNr = { fg = Preferences.designSystem.palette.purple },  -- Line Numbers
      CursorLineNr = { fg = Preferences.designSystem.palette.magenta }  -- Focused Line
    }
}
vim.cmd("colorscheme material-darker")
