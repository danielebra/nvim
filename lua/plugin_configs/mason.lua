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

-- require("lsp.lua")
require("lsp.efm")
-- require("lsp.cloudformation")
-- require("lsp.django_templates")
-- require("lsp.html")
