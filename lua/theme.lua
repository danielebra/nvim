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

    -- Highlighted yank
    vim.api.nvim_command("hi clear HighlightedyankRegion")
    if Preferences.designSystem.yank.useReverse == true then 
        vim.api.nvim_command("hi HighlightedyankRegion gui=reverse")
    else
        vim.api.nvim_command("hi HighlightedyankRegion  guifg=black guibg=" .. Preferences.designSystem.palette.yellow)
    end
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
    vim.api.nvim_command( 'hi Boolean gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)
    -- Ideally this bright green would be for f strings"
    -- exec "hi String guifg=" . s:bright_green
    vim.api.nvim_command("hi String guifg=" .. Preferences.designSystem.palette.green)
    -- Make comments more visible
    vim.api.nvim_command("hi Comment guifg=" .. Preferences.designSystem.palette.lightGray)

end

local function TypescriptColours()
    vim.api.nvim_command( 'hi TypescriptReserved gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)

    vim.api.nvim_command( 'hi typescriptDotNotation gui=bold guifg=' .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command( 'hi typescriptEndColons gui=bold guifg=' .. Preferences.designSystem.palette.lightBlue)

    -- if
    vim.api.nvim_command( 'hi typescriptConditional guifg=' .. Preferences.designSystem.palette.lightBlue)
    -- return
    vim.api.nvim_command( 'hi typescriptStatement guifg=' .. Preferences.designSystem.palette.lightBlue)

    -- const
    vim.api.nvim_command( 'hi typescriptStorageClass guifg=' .. Preferences.designSystem.palette.purple)
    -- => this also is impacting ===, maybe disable it?
    vim.api.nvim_command( 'hi typescriptOpSymbols guifg=' .. Preferences.designSystem.palette.purple)
end

local function PythonColours()
    -- " Make quotation symbol blue
    vim.api.nvim_command("hi pythonQuotes guifg=" .. Preferences.designSystem.palette.lightBlue)
    -- " Make class purple
    vim.api.nvim_command("hi pythonStatement guifg="..  Preferences.designSystem.palette.purple)
    -- " Make functions yellow
    vim.api.nvim_command('hi pythonFunction guifg=' .. Preferences.designSystem.palette.yellow)

    -- " Make reserved words orange
    -- " Unfortunaletly, this is bleeding into True and False
    vim.api.nvim_command("hi pythonBuiltin gui=bold guifg=" .. Preferences.designSystem.palette.orange)

    vim.api.nvim_command( 'hi PythonKeyword gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)
    -- " for, while
    vim.api.nvim_command( 'hi pythonRepeat guifg=' .. Preferences.designSystem.palette.lightBlue)

    -- " Make import statements light blue
    vim.api.nvim_command( 'hi pythonInclude gui=italic guifg=' .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command( 'hi pythonConditional guifg=' .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command( "hi pythonDecoratorName guifg=" .. Preferences.designSystem.palette.blue)
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

    vim.api.nvim_command( "hi TSParameter guifg=" .. Preferences.designSystem.palette.pink)
    vim.api.nvim_command( "hi TSKeyword guifg=" .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command( "hi TSConditional guifg=" .. Preferences.designSystem.palette.lightBlue)
    vim.api.nvim_command( "hi TSFunctionBuiltin gui=italic guifg=" .. Preferences.designSystem.palette.orange)
    vim.api.nvim_command( "hi TSInclude gui=italic guifg=" .. Preferences.designSystem.palette.lightBlue)
end

local function BarBar()
    -- " Buffer tab bar
    vim.api.nvim_command( 'hi BufferCurrent guibg=' .. Preferences.designSystem.palette.purple)
    vim.api.nvim_command( 'hi BufferCurrentSign guibg=' .. Preferences.designSystem.palette.purple)
    -- " exec 'hi BufferCurrent guifg=' . s:purple
    -- " exec 'hi BufferCurrentSign guifg=' . s:purple

    vim.api.nvim_command( 'hi BufferVisible guifg=none guibg=none')
    vim.api.nvim_command( 'hi BufferVisibleSign guifg=none guibg=none')
    vim.api.nvim_command( 'hi link BufferVisibleMod BufferInactiveMod')
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
end

-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
-- At the time of creating this file, nvim doesn't support augroup. See PR: https://github.com/neovim/neovim/pull/12378
function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup '..group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

nvim_create_augroups({
    _yank = {
        {'TextYankPost', '*', "lua require('vim.highlight').on_yank({higroup = 'HighlightedyankRegion', timeout = " .. Preferences.designSystem.yank.highlightDuration .. "})"}

        },
    _customTheme = {
        { "ColorScheme", "*", "lua _apply_custom_theme()" }
    }
})

