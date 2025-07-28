require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", "lua", "dockerfile", "graphql", "javascript", "json", "html", "python", "regex", "scss", "typescript",
        "yaml"
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {},
    matchup = {
        enable = true -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
    highlight = {
        enable = true -- false will disable the whole extension
    },
    context_commentstring = {
        enable = true,
        config = {
            typescriptreact = {
                __default = 'xx// %s',
                jsx_element = 'xx{/* %s */}',
                jsx_fragment = 'xx{/* %s */}',
                jsx_attribute = 'xx// %s',
                comment = 'xx// %s'
            }
        }
    },
    -- context_commentstring = {enable = true, config = {css = '// %s'}},
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- TODO seems to be broken
    indent = {enable = false},
    -- indent = {enable = {"javascriptreact", "python"}},
    autotag = {enable = true},

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
require("ts_context_commentstring").setup{}
vim.g.skip_ts_context_commentstring_module = true
