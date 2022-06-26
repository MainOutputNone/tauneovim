local lspconfig = require'lspconfig.configs'

require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.rust_analyzer.setup{}
