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

    rainbow = {
        enable = true,
        colors = {
            Preferences.designSystem.palette.lightBlue,
            Preferences.designSystem.palette.purple,
            Preferences.designSystem.palette.yellow,
            Preferences.designSystem.palette.orange,
            Preferences.designSystem.palette.maroon,
            Preferences.designSystem.palette.brightGreen,
            Preferences.designSystem.palette.lightGray,
        }
    }
}
