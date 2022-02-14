-- Handle auto setting up packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it existg
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- Deprecated and moved to nvim_tree setup()
-- vim.g.nvim_tree_disable_netrw = 0
-- vim.g.nvim_tree_hijack_netrw = 0

-- Note: Specify { "package", opt = true } (emphasis on opt) to keep a package in the list
-- but not have it loaded into the neovim session.
-- Specify require_plugin("package") to have it loaded into session.
return require("packer").startup(function(use)
    use "wbthomason/packer.nvim" -- Package manager
    use "kyazdani42/nvim-web-devicons" -- Icons used for tree and others
    use "kyazdani42/nvim-tree.lua" -- File explorer
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "romgrk/barbar.nvim" -- Buffer bar
    use "neovim/nvim-lspconfig" -- Language server
    use {"hrsh7th/nvim-compe", requires = {"hrsh7th/vim-vsnip"}} -- Autocomplete

    use {"kaicataldo/material.vim", branch = 'main'}
    use {"folke/trouble.nvim"} -- Pretty diagnostics
    use {"folke/which-key.nvim"} -- Hotkey cheat sheet
    use {"christoomey/vim-tmux-navigator"} -- Move between splits and tmux panes
    use {"akinsho/nvim-toggleterm.lua"} -- Terminal
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- Telescope
    use {"nvim-telescope/telescope.nvim", requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    use {"nvim-telescope/telescope-project.nvim", opt = true}

    use 'folke/lsp-colors.nvim' -- Fill in the missing colours that lsp uses

    use 'tpope/vim-commentary' -- Comment provider
    -- use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- File context aware comment provider

    use "NTBBloodbath/galaxyline.nvim" -- Bottom line # Galxyline fork due to breaking changes in v0.6.1 (author MIA)
    -- use "glepnir/galaxyline.nvim" -- Bottom line
    -- use "ahmedkhalf/lsp-rooter.nvim" -- Use LSP to switch to root of project
    use "norcalli/nvim-colorizer.lua" -- Colours for RGB etc
    use "tpope/vim-surround" -- Control surrounding symbols
    use "tpope/vim-sleuth" -- Tabwidth detection
    use "rmagatti/auto-session" -- Session management

    use {"ray-x/lsp_signature.nvim"} -- See signatures as you type
    use {"hashivim/vim-terraform"} -- Terraform & hcl support
    -- use {"lukas-reineke/indent-blankline.nvim", branch = "lua", opt=true} -- Indendation lines
    use {"SmiteshP/nvim-gps"} -- Context of current code location

    use {'CosmicNvim/cosmic-ui', requires = {{'MunifTanjim/nui.nvim'}, {'nvim-lua/plenary.nvim'}}} -- Code Actions floating UI

    use {"rcarriga/nvim-notify"} -- Notification UI

end)

