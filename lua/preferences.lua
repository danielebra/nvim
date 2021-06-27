Preferences = {
    designSystem = {
        palette = {
            blue = '#82AAFF',
            lightBlue = '#89DDFF',
            purple = '#C792EA',
            magenta = '#E435E4',
            darkGray = '#605D5D',
            gray = '#C2BABA',
            lightGray = '#C2C2C2',
            yellow = '#FFCB6B',
            maroon = '#F07178',
            pink = '#FF69B4',
            brightGreen = '#A8F92E',
            green = '#C3E88D',
            orange = '#F78C6C'
        },
        enableTransparency = false,
        yank = {
          highlightDuration = 250,
          useReverse = true, -- Background of highlighted region will be reversed when true, or yellow when false
        }
    },
    enableSumnekoLuaLanguageServer = true, -- Provided by sumneko, requires submodule init for dependencies
    python = {
        enableBlack = true, -- This formats code on <leader> f
        enableIsort = true, -- This formats code on <leader> f
        enableFlake8 = true, -- This provides linter/format feedback to diagnostic system
        extraPaths = {}, -- This is used by pyright (lsp) to compute additional python paths
    },
    git = {
        showInlineBlame = true,
        inlineBlameDelay =  200,
    }
}
