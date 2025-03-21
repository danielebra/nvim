-- :MasonInstall django-template-lsp
require("lspconfig").djlsp.setup({
        root_dir = require("lspconfig.util").root_pattern("manage.py", ".git"),
})
