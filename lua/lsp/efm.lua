local python_options = {} -- We will build this based on the user defined Preferences

local flake8 = {
    LintCommand = "flake8 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
local black = {formatCommand = "black --quiet -", formatStdin = true}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}

if Preferences.python.enableFlake8 == true then table.insert(python_options, flake8) end
if Preferences.python.enableBlack == true then table.insert(python_options, black) end
if Preferences.python.enableIsort == true then table.insert(python_options, isort) end

local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local tsserver = {
    {
        lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
        lintIgnoreExitCode = true,
        lintStdin = true,
        lintFormats = {"%f:%l:%c: %m"},
        formatCommand = "eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
        formatStdin = true
    }, prettier
}

-- This is pretty jank but gets the job done
local hclformat = {
    formatCommand = "terragrunt hclfmt ${INPUT} 1>/dev/null 2>/dev/null && cat ${INPUT}",
    formatStdin = true
}

require"lspconfig".efm.setup {
    filetypes = {
        "lua", "python", "javascriptreact", "javascript", "typescript", "typescriptreact", "sh", "html", "css", "json",
        "yaml", "markdown", "hcl"
    },
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {{formatCommand = "lua-format -i --column-limit=120", formatStdin = true}},
            markdown = {{formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}},
            python = python_options,
            javascript = tsserver,
            javascriptreact = tsserver,
            typescript = tsserver,
            typescriptreact = tsserver,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            hcl = {hclformat}
        }
    }
}
