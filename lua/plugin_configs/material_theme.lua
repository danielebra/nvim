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
      -- Good to know, but we use the default
      -- colors.syntax.fn -- Function names
      -- Experimenting
      colors.editor.accent = Preferences.designSystem.palette.lightBlue
    end,
    custom_highlights = {
      LineNr = { fg = Preferences.designSystem.palette.purple },  -- Line Numbers
      CursorLineNr = { fg = Preferences.designSystem.palette.magenta },  -- Focused Line
      ["@keyword"] = { fg = Preferences.designSystem.palette.purple },  -- `class`, `self` keywords
      ["@keyword.return"] = { fg = Preferences.designSystem.palette.lightBlue },  -- `return` statement
      ["@keyword.operator"] = { fg = Preferences.designSystem.palette.lightBlue },  -- `in`
      ["@variable.builtin"] = { fg = Preferences.designSystem.palette.yellow },  -- `self`
      ["@function.builtin"] = { fg = Preferences.designSystem.palette.lightBlue},  -- `super()`
      ["@constructor"] = { fg = Preferences.designSystem.palette.yellow},  -- `xx.yy.Foo()`
      ["@Boolean"] = { fg = Preferences.designSystem.palette.maroon},  -- `xx.yy.Foo()` changes colour of Foo
      ["@variable.member"] = { fg = "white" },  -- `xx.yy` changes colour of yy
      -- ["Special"] = { fg = Preferences.designSystem.palette.purple }  -- `xx.yy` changes colour of yy
      ["Special"] = { fg = "#BB80B3" },
      ["Normal"] = { fg = "white" },
      -- "#C792EA"
      -- B480D6
    },
    plugins = {
      -- "nvim-tree",
      -- "nvim-web-devicons",
      -- "telescope",
      "gitsigns",
      -- "nvim-cmp",
      -- "which-key",

    }
}
vim.cmd("colorscheme material-darker")
