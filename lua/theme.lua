-- Note: This theme has been ported from my pre 0.5 neovim config. It was made before I ported to Lua. The theme
-- was orignally from my custom vscode theme.
-- Main part that has been updated here is the LSP & BarBar overrides, 
-- the rest may not be applicable any more but have left them in case
-- I have also removed the custom TODO finder that used regex. Look back in git history for file in nvim/custom/theme.vim
local function Editor()
    -- Line numbers
    vim.api.nvim_command('hi LineNr guifg=' .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command('hi CursorLineNr guifg=' .. Preferences.designSystem.palette.magenta)

    vim.api.nvim_command("hi Visual guifg=none guibg=#4b4b4b")
    vim.api.nvim_command("hi Search guifg=red guibg=#4b4b4b")
    vim.api.nvim_command("hi IncSearch guifg=red guibg=#74716fa1")

    -- Restore Pre neovim 0.10 search behaviour
    vim.api.nvim_command("hi CurSearch NONE")
    vim.api.nvim_command("hi link CurSearch Search")

    -- Make the opposing bracket more visible
    vim.api.nvim_command("hi MatchParen guifg=" .. Preferences.designSystem.palette.brightGreen .. " guibg=gray")

    -- Remove black background from Floating content.
    vim.api.nvim_command("hi NormalFloat guibg=None")

    -- Highlighted yank
    vim.api.nvim_command("hi clear HighlightedyankRegion")
    if Preferences.designSystem.yank.useReverse == true then
        vim.api.nvim_command("hi HighlightedyankRegion gui=reverse")
    else
        vim.api.nvim_command("hi HighlightedyankRegion  guifg=black guibg=" .. Preferences.designSystem.palette.yellow)
    end

    -- Buffer seperations
    vim.api.nvim_command("hi WinSeparator guifg=#545454")
end

local function TransparentBackground()
    vim.api.nvim_command('hi Normal guibg=NONE ctermbg=NONE')
    vim.api.nvim_command('hi SignColumn guibg=NONE ctermbg=NONE')
end

local function SemshiColours()
    -- Params become bold and gray
    vim.api.nvim_command('hi semshiParameter gui=bold guifg=' .. Preferences.designSystem.palette.gray)
    -- Self becomes yellow to match (classes)
    vim.api.nvim_command('hi semshiSelf  guifg=' .. Preferences.designSystem.palette.yellow)
    -- self.attribute
    vim.api.nvim_command('hi semshiAttribute  guifg=' .. Preferences.designSystem.palette.maroon)
    -- Errors
    vim.api.nvim_command('hi semshiErrorChar  guifg=' .. 'red')
    -- Underline matching symbols"
    vim.api.nvim_command("hi semshiSelected gui=underline guifg=none guibg=none")

    -- exec "hi semshiImported gui=bold guifg=" . s:pink
end

local function SharedColours()
    vim.api.nvim_command('hi Todo guifg=red guibg=black')
    vim.api.nvim_command('hi Boolean gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)
    -- Ideally this bright green would be for f strings"
    -- exec "hi String guifg=" . s:bright_green
    vim.api.nvim_command("hi String guifg=" .. Preferences.designSystem.palette.green)
    -- Make comments more visible
    vim.api.nvim_command("hi Comment guifg=" .. Preferences.designSystem.palette.lightGray)
    vim.api.nvim_command("hi @comment guifg=" .. Preferences.designSystem.palette.lightGray)

end

local function TypescriptColours()
    vim.api.nvim_command('hi TypescriptReserved gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)

    vim.api.nvim_command('hi typescriptDotNotation gui=bold guifg=' .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command('hi typescriptEndColons gui=bold guifg=' .. Preferences.designSystem.palette.lightBlue)

    -- if
    vim.api.nvim_command('hi typescriptConditional guifg=' .. Preferences.designSystem.palette.lightBlue)
    -- return
    vim.api.nvim_command('hi typescriptStatement guifg=' .. Preferences.designSystem.palette.lightBlue)

    -- const
    vim.api.nvim_command('hi typescriptStorageClass guifg=' .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command('hi typescriptVariable guifg=' .. Preferences.designSystem.palette.purple)
    -- => this also is impacting ===, maybe disable it?
    vim.api.nvim_command('hi typescriptOpSymbols guifg=' .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command('hi typescriptBinaryOp guifg=' .. Preferences.designSystem.palette.purple)

end

local function PythonColours()
    -- " Make quotation symbol blue
    vim.api.nvim_command("hi pythonQuotes guifg=" .. Preferences.designSystem.palette.lightBlue)
    -- " Make class purple
    vim.api.nvim_command("hi pythonStatement guifg=" .. Preferences.designSystem.palette.purple)
    -- " Make functions yellow
    vim.api.nvim_command('hi pythonFunction guifg=' .. Preferences.designSystem.palette.yellow)

    -- " Make reserved words orange
    -- " Unfortunaletly, this is bleeding into True and False
    vim.api.nvim_command("hi pythonBuiltin gui=bold guifg=" .. Preferences.designSystem.palette.orange)

    vim.api.nvim_command('hi PythonKeyword gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)
    -- " for, while
    vim.api.nvim_command('hi pythonRepeat guifg=' .. Preferences.designSystem.palette.lightBlue)

    -- " Make import statements light blue
    vim.api.nvim_command('hi pythonInclude gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command('hi pythonConditional guifg=' .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi pythonDecoratorName guifg=" .. Preferences.designSystem.palette.blue)

    -- Make built ins yellow, such as ImportError
    vim.api.nvim_command("hi @type.builtin.python guifg=" .. Preferences.designSystem.palette.yellow)

    vim.api.nvim_command("hi @module.python guifg=white")
end

local function LSPColours()
    -- " exec "hi pythonTSIdentifer guifg=" . s:gray
    -- " exec "hi Identifier guifg=" . s:gray
    -- " exec "hi Identifier guifg=" . s:magenta
    vim.api.nvim_command("hi pythonTSParameter guifg=" .. Preferences.designSystem.palette.pink)
    -- " exec "hi pythonTSKeyword guifg=" . s:lightBlue
    vim.api.nvim_command("hi pythonTSKeyword guifg=" .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command("hi pythonTSConditional guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi pythonTSFunctionBuiltin gui=italic guifg=" .. Preferences.designSystem.palette.orange)
    vim.api.nvim_command("hi pythonTSInclude gui=italic guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi Constant gui=bold guifg=" .. Preferences.designSystem.palette.darkGray)

    -- " exec "hi pythonTSMethod gui=italic guifg=" . s:orange " Function calls

    vim.api.nvim_command("hi TSParameter guifg=" .. Preferences.designSystem.palette.pink)
    vim.api.nvim_command("hi TSKeyword guifg=" .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command("hi TSConditional guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi TSFunctionBuiltin gui=italic guifg=" .. Preferences.designSystem.palette.orange)
    vim.api.nvim_command("hi TSInclude gui=italic guifg=" .. Preferences.designSystem.palette.lightBlue)

    -- Errors (match galaxy line - which is not in design system)
    vim.api.nvim_command("hi DiagnosticError guifg=#F44747")
    vim.api.nvim_command("hi LspDiagnosticsDefaultError guifg=#F44747")
    vim.api.nvim_command("hi DiagnosticHint guifg=#FFCC66")
    vim.api.nvim_command("hi LspDiagnosticsDefaultHint guifg=#FFCC66")
    vim.api.nvim_command("hi LspDiagnosticsDefaultInformation guifg=#4FC1FF")
    vim.api.nvim_command("hi LspDiagnosticsDefaultWarning guifg=#FF8800")
end

local function LSPColoursBreakingChange()
    vim.api.nvim_command("hi keyword guifg=" .. Preferences.designSystem.palette.purple)

    vim.api.nvim_command("hi @parameter guifg=" .. Preferences.designSystem.palette.pink)

    vim.api.nvim_command("hi function.builtin gui=italic guifg=" .. Preferences.designSystem.palette.orange)

    vim.api.nvim_command("hi constant gui=bold guifg=" .. Preferences.designSystem.palette.darkGray)
    vim.api.nvim_command("hi @constant.python gui=bold guifg=" .. Preferences.designSystem.palette.darkGray)

    vim.api.nvim_command("hi @Constructor guifg=" .. Preferences.designSystem.palette.yellow)

    vim.api.nvim_command("hi @variable.builtin guifg=" .. Preferences.designSystem.palette.yellow) -- Create a visual reference between an instance and a class (eg self matches the colour of a class constructor)

    -- Not sure about this one, but this keeps it same colour as before
    vim.api.nvim_command("hi @attribute.builtin guifg=" .. Preferences.designSystem.palette.blue)

    vim.api.nvim_command("hi @boolean guifg=" .. Preferences.designSystem.palette.maroon)

    -- Experimenting with a different shade of blue here as it is similar to the gray and lightblue
    vim.api.nvim_command("hi @field guifg=" .. "lightblue")--.. Preferences.designSystem.palette.gray)

    vim.api.nvim_command("hi @keyword.operator guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi statement guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi include gui=italic guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi conditional guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi @function.builtin guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi @keyword.return guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command("hi @constant.builtin guifg=" .. Preferences.designSystem.palette.lightBlue)

    vim.api.nvim_command("hi @variable guifg=white")

    -- typescript language server marks everything as Identifier
    vim.api.nvim_command("hi Identifier guifg=white")
end

local function BarBar()
    -- " Buffer tab bar
    vim.api.nvim_command('hi BufferCurrent guibg=' .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command('hi BufferCurrentSign guibg=' .. Preferences.designSystem.palette.purple)
    -- " exec 'hi BufferCurrent guifg=' . s:purple
    -- " exec 'hi BufferCurrentSign guifg=' . s:purple

    vim.api.nvim_command('hi BufferVisible guifg=none guibg=none')
    vim.api.nvim_command('hi BufferVisibleSign guifg=none guibg=none')
    vim.api.nvim_command('hi link BufferVisibleMod BufferInactiveMod')
end

local function GalaxyLine()
    vim.api.nvim_command('hi Statusline guibg=' ..  '#14161c')
end


local function GitSigns()
    vim.api.nvim_command('hi GitSignsCurrentLineBlame guifg=#545454 guibg=' ..  '#14161c')
    -- Can perhaps go to another function about file tree
    -- Has changes
    vim.api.nvim_command('hi NvimTreeGitDirtyIcon guifg=' .. Preferences.designSystem.palette.yellow)
    -- Contains deleted file
    vim.api.nvim_command('hi NvimTreeGitDeletedIcon guifg=#F44747')
    -- Is new
    vim.api.nvim_command('hi NvimTreeGitNewIcon guifg=' .. Preferences.designSystem.palette.lightBlue)
    -- Is staged
    vim.api.nvim_command('hi NvimTreeGitStagedIcon guifg=' .. Preferences.designSystem.palette.green)
    -- README.md, Makefile etc
    vim.api.nvim_command('hi NvimTreeSpecialFile guifg=' .. Preferences.designSystem.palette.darkGray)
end

local function DiffPassThrough()
    -- Allow text colour pass through for highlight groups
    vim.api.nvim_command("hi DiffAdd guifg=NONE")
    vim.api.nvim_command("hi DiffChange guifg=NONE")
    vim.api.nvim_command("hi DiffText guifg=NONE")
    vim.api.nvim_command("hi DiffDelete guifg=NONE")

end

local function CompletionColours() 
    -- Searching/Completion menu
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#BB80B3' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { bg='NONE', fg='#BB80B3' })

    vim.api.nvim_set_hl(0, 'CmpItemKindText', { bg='NONE', fg=Preferences.designSystem.palette.green})

    -- Class
    vim.api.nvim_set_hl(0, 'CmpItemKindClass', { bg='NONE', fg=Preferences.designSystem.palette.yellow})
    -- Function
    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg=Preferences.designSystem.palette.blue})
    vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
    -- Variable
    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='white' })
end


function _apply_custom_theme()
    Editor()
    if Preferences.designSystem.enableTransparency == true then TransparentBackground() end
    SemshiColours()
    SharedColours()
    TypescriptColours()
    PythonColours()
    LSPColours()
    BarBar()
    GalaxyLine()
    GitSigns()
    LSPColoursBreakingChange()
    CompletionColours()
    DiffPassThrough()
end

-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
-- At the time of creating this file, nvim doesn't support augroup. See PR: https://github.com/neovim/neovim/pull/12378
function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup ' .. group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

nvim_create_augroups({
    _yank = {
        {
            'TextYankPost', '*',
            "lua require('vim.highlight').on_yank({higroup = 'HighlightedyankRegion', timeout = " ..
                Preferences.designSystem.yank.highlightDuration .. "})"
        }

    },
    _customTheme = {{"ColorScheme", "*", "lua _apply_custom_theme()"}},
    resize_on_window_change = {{"VimResized", "*", ":wincmd =" }}
})

_apply_custom_theme() -- :thinking: theme is not applying automatically?



local hl = function(group, opts)
    opts.default = true
    vim.api.nvim_set_hl(0, group, opts)
end


if Preferences.designSystem.linkTreesitterGroups then 
-- Misc {{{
    hl('@comment', {link = 'Comment'})
    -- hl('@error', {link = 'Error'})
    hl('@none', {bg = 'NONE', fg = 'NONE'})
    hl('@preproc', {link = 'PreProc'})
    hl('@define', {link = 'Define'})
    hl('@operator', {link = 'Operator'})
    -- }}}

    -- Punctuation {{{
    hl('@punctuation.delimiter', {link = 'Delimiter'})
    hl('@punctuation.bracket', {link = 'Delimiter'})
    hl('@punctuation.special', {link = 'Delimiter'})
    -- }}}

    -- Literals {{{
    hl('@string', {link = 'String'})
    hl('@string.regex', {link = 'String'})
    hl('@string.escape', {link = 'SpecialChar'})
    hl('@string.special', {link = 'SpecialChar'})

    hl('@character', {link = 'Character'})
    hl('@character.special', {link = 'SpecialChar'})

    hl('@boolean', {link = 'Boolean'})
    hl('@number', {link = 'Number'})
    hl('@float', {link = 'Float'})
    -- }}}

    -- Functions {{{
    hl('@function', {link = 'Function'})
    hl('@function.call', {link = 'Function'})
    hl('@function.builtin', {link = 'Special'})
    hl('@function.macro', {link = 'Macro'})

    hl('@method', {link = 'Function'})
    hl('@method.call', {link = 'Function'})

    hl('@constructor', {link = 'Special'})
    hl('@parameter', {link = 'Identifier'})
    -- }}}

    -- Keywords {{{
    hl('@keyword', {link = 'Keyword'})
    hl('@keyword.function', {link = 'Keyword'})
    hl('@keyword.operator', {link = 'Keyword'})
    hl('@keyword.return', {link = 'Keyword'})

    hl('@conditional', {link = 'Conditional'})
    hl('@repeat', {link = 'Repeat'})
    hl('@debug', {link = 'Debug'})
    hl('@label', {link = 'Label'})
    hl('@include', {link = 'Include'})
    hl('@exception', {link = 'Exception'})
    -- }}}

    -- Types {{{
    hl('@type', {link = 'Type'})
    hl('@type.builtin', {link = 'Type'})
    hl('@type.qualifier', {link = 'Type'})
    hl('@type.definition', {link = 'Typedef'})

    hl('@storageclass', {link = 'StorageClass'})
    hl('@attribute', {link = 'PreProc'})
    hl('@field', {link = 'Identifier'})
    hl('@property', {link = 'Identifier'})
    -- }}}

    -- Identifiers {{{
    hl('@variable', {link = 'Normal'})
    hl('@variable.builtin', {link = 'Special'})

    hl('@constant', {link = 'Constant'})
    hl('@constant.builtin', {link = 'Special'})
    hl('@constant.macro', {link = 'Define'})

    hl('@namespace', {link = 'Include'})
    hl('@symbol', {link = 'Identifier'})
    -- }}}

    -- Text {{{
    hl('@text', {link = 'Normal'})
    hl('@text.strong', {bold = true})
    hl('@text.emphasis', {italic = true})
    hl('@text.underline', {underline = true})
    hl('@text.strike', {strikethrough = true})
    hl('@text.title', {link = 'Title'})
    hl('@text.literal', {link = 'String'})
    hl('@text.uri', {link = 'Underlined'})
    hl('@text.math', {link = 'Special'})
    hl('@text.environment', {link = 'Macro'})
    hl('@text.environment.name', {link = 'Type'})
    hl('@text.reference', {link = 'Constant'})

    hl('@text.todo', {link = 'Todo'})
    hl('@text.note', {link = 'SpecialComment'})
    hl('@text.warning', {link = 'WarningMsg'})
    hl('@text.danger', {link = 'ErrorMsg'})
    -- }}}

    -- Tags {{{
    hl('@tag', {link = 'Tag'})
    hl('@tag.attribute', {link = 'Identifier'})
    hl('@tag.delimiter', {link = 'Delimiter'})
    -- }}}
end
