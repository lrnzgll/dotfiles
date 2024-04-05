require("mason").setup()
require("mason-lspconfig").setup()

require'lspconfig'.solargraph.setup{}
require('lspconfig').gopls.setup({})

require('go').setup({})

