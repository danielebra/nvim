local duped_on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    client.server_capabilities.documentFormattingProvider = false
    -- Trialing the usage of `hrsh7th/cmp-nvim-lsp-signature-help` instead of lsp_signature
    -- require("lsp_signature").on_attach({
    --     hint_enable = true,
    --     hint_prefix = ' ',
    --     max_width = 60,
    --     hi_parametr= "Statement",
    --     -- floating_window = Preferences.displayFloatingSignatures,

    -- })

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- TODO: Clean these hotkeys up and move to which key file
    -- I have prefixed conflicts with <leader> l
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    buf_set_keymap('n', '<leader>lK', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts) -- Conflict with tmux up
    buf_set_keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- Conflicts with goto last insert
    buf_set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- Confilcts with tmux up
    buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts) -- Conflict with write
    buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts) -- Conflict with write
    buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts) -- Conflict with write
    buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- Now handled by cosmic-ui in which-key
    buf_set_keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"}<CR>', opts)
    buf_set_keymap('n', '<leader>lN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>ln', '<cmd>lua vim.diagnostic.goto_next { float = false }<CR>', opts)
    buf_set_keymap('n', '<space>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts) -- Conflict with quit
    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts) -- Prefixed with l for now
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)

end

require("mason").setup({
})

-- Bootleg ensure_installed because it doesnt exist in mason
-- https://github.com/williamboman/mason.nvim/issues/130#issuecomment-1217773757
vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(Preferences.linters, " "))
end, {})

require("mason-lspconfig").setup({
    ensure_installed =  Preferences.languageServers

})

local nvim_lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup { on_attach = duped_on_attach, capabilities = capabilities}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["pyright"] = function ()
        nvim_lsp.pyright.setup {
            on_attach = duped_on_attach,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true,
                        extraPaths = Preferences.python.extraPaths
                    }
                }
        }
    }
    end
}

require("lsp.lua")
require("lsp.efm")
