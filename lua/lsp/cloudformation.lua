require('lspconfig.configs').cfn_lsp = {
  default_config = {
    cmd = { os.getenv("HOME") .. '/.local/bin/cfn-lsp-extra' },
    filetypes = { 'yaml.cloudformation', 'json.cloudformation' },
    root_dir = function(fname)
      return require('lspconfig').util.find_git_ancestor(fname) or vim.fn.getcwd()
    end,
    settings = {
      documentFormatting = false,
    },
  },
}
require('lspconfig').cfn_lsp.setup{}
