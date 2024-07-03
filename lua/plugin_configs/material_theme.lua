local material = require 'material'
local colors = require 'material.colors'

material.setup{
    custom_colors = function(colors)
      colors.syntax.comments = Preferences.designSystem.palette.lightGray
    end
}
vim.cmd("colorscheme material-darker")
