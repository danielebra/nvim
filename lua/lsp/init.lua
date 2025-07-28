vim.diagnostic.config({
  virtual_text = true,  -- inline
  virtual_lines = false,  -- additional line
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
    }
  }
})

local navic = require("nvim-navic")
local duped_on_attach = function(client, bufnr)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- Honestly consider permanently moving these bindings to always be active
    -- Then they can be documented in which key, and this duped atachment can likely be removed
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
    buf_set_keymap('n', '<leader>lgr', '<cmd>Trouble lsp toggle focus=true win.position=right<cr>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"}<CR>', opts)
    buf_set_keymap('n', '<leader>lN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>ln', '<cmd>lua vim.diagnostic.goto_next { float = false }<CR>', opts)
    buf_set_keymap('n', '<space>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts) -- Conflict with quit
    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts) -- Prefixed with l for now

end

vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- Override every on attach with:
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    if client and bufnr then
      duped_on_attach(client, bufnr)
    end
  end,
})
