local python_options = {} -- We will build this based on the user defined Preferences

local flake8 = {
    LintCommand = "flake8 --max-line-length=100 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    rootMarkers = {"pyproject.toml"}
}
local mypy = {
    lintCommand = "mypy --show-column-numbers",
    -- lintFormats = {"%f=%l:%c: %trror: %m", "%f=%l:%c: %tarning: %m", "%f=%l:%c: %tote: %m"},
    lintIgnoreExitCode = true,
    lintSource = "mypy",
    -- lintFormats = {
    --     "%f:%l:%c: %terror: %m",
    --     "%f:%l:%c: %tarning: %m",
    --     "%f:%l:%c: %tote: %m",
    -- }
}
local black = {formatCommand = "black --quiet -", formatStdin = true, rootMarkers = {"pyproject.toml"}}
local isort = {formatCommand = "isort --quiet -", formatStdin = true, rootMarkers = {"pyproject.toml"}}

local ruff = {
    lintCommand = "ruff --quiet ${INPUT}",
    lintStdin = true,
    lintFormats = "%f:%l:%c: %m",
    formatCommand = "ruff --stdin-filename ${INPUT} --fix --exit-zero --quiet -",
    formatStdin = true
}

if Preferences.python.enableFlake8 == true then table.insert(python_options, flake8) end
if Preferences.python.enableBlack == true then table.insert(python_options, black) end
if Preferences.python.enableIsort == true then table.insert(python_options, isort) end
if Preferences.python.enableMypy == true then table.insert(python_options, mypy) end
if Preferences.python.enableRuff == true then table.insert(python_options, ruff) end

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

local terraform = {
    -- formatCommand = "TerraformFmt",
    formatCommand = "terraform fmt -",
    formatStdin = true
}

local cloudformation = {
    lintCommand = "cfn-lint --format=parseable -",
    lintStdin = true,
    lintIgnoreExitCode = true,
}

local djlint = {
    formatCommand = "djlint --reformat --quiet --warn -",
    formatStdin = true,
}

require"lspconfig".efm.setup {
    filetypes = {
        "lua", "python", "javascriptreact", "javascript", "typescript", "typescriptreact", "sh", "html", "css", "json",
        "yaml", "markdown", "hcl", "terraform", "yaml.cloudformation", "htmldjango"
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
            htmldjango = {djlint},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
            -- ["yaml.cloudformation"] = {cloudformation},
            hcl = {hclformat},
            terraform = {terraform},
        }
    }
}
-- Autoformat terraform & javascript on save
vim.cmd [[autocmd BufWritePre *.tf,*.js lua vim.lsp.buf.format { async = true }]]
