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
        enableTransparency = true,
        yank = {
          highlightDuration = 250,
          useReverse = true, -- Background of highlighted region will be reversed when true, or yellow when false
        },
        linkTreesitterGroups = false, -- For backwards compatibality with neovim 0.7. In 0.8, treesitter has breaking changes. Enable this to link old highlight groups to their new names
        icons = {
            error = "",
            warning = "",
            info = "",
            hint = "",
            docker = "",
            dot = "",
        }
    },
    enableSumnekoLuaLanguageServer = false, -- Provided by sumneko, requires submodule init for dependencies
    insertModeLSPDiagnostics = true, -- Display LSP diagnotic feedback while in insert mode
    python = {
        enableBlack = true, -- This formats code on <leader> f
        enableIsort = true, -- This formats code on <leader> f
        enableFlake8 = true, -- This provides linter/format feedback to diagnostic system
        extraPaths = {}, -- This is used by pyright (lsp) to compute additional python paths
        enableMypy = true, -- This provides linter/format feedback to diagnostic system
        enableRuff = false, -- Fast python linting and formatting with ruff (Rust tool)
    },
    git = {
        showInlineBlame = true,
        inlineBlameDelay =  200,
    },
    displayFloatingSignatures = false, -- When typing, a floating window will apprear with signature help
    linters = {"black", "prettier", "flake8", "mypy", "isort", "eslint-lsp" },
    languageServers = { "bashls", "dockerls", "graphql", "tsserver", "marksman", "pyright", "terraformls", "yamlls", "jsonls"},
    displayGitSignsWhenStaged = false,
}
