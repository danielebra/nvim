vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
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

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 1,
    },
    signs = true,
    underline = true,
    update_in_insert = Preferences.insertModeLSPDiagnostics,
  }
)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "  (Reference)", -- 
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    "  (Struct)", --  ﳤ
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}


if Preferences.enableSumnekoLuaLanguageServer == true then
  -- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
  USER = vim.fn.expand('$USER')

  local sumneko_root_path = ""
  local sumneko_binary = ""

  -- TODO: Review lua lsp for more stable approach
  if vim.fn.has("mac") == 1 then
      sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
      sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lua-language-server/bin/lua-language-server"
  elseif vim.fn.has("unix") == 1 then
      sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
      sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
  else
      print("Unsupported system for sumneko")
  end

  require'lspconfig'.sumneko_lua.setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
      settings = {
          Lua = {
              runtime = {
                  -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                  version = 'LuaJIT',
                  -- Setup your lua path
                  path = vim.split(package.path, ';')
              },
              diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = {'vim'}
              },
              workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
              }
          }
      }
  }
end
