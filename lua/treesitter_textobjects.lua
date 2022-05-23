require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- f = function
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        -- c = class
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        -- C = comment
        ["aC"] = "@comment.outer",
        -- l = loop
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
  },
}
