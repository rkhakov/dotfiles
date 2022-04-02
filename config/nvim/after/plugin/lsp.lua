local on_attach = function()
  local map = vim.keymap.set
  local opts = {buffer = 0, noremap=true, silent=true}

  map('n', '<F8>', vim.diagnostic.open_float, opts)
  map('n', '<F6>', vim.diagnostic.goto_prev, opts)
  map('n', '<F7>', vim.diagnostic.goto_next, opts)
  map('n', '<leader>ll', vim.diagnostic.setloclist, opts)

  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
end

local make_client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(make_client_capabilities)

local servers = { 'pyright' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

