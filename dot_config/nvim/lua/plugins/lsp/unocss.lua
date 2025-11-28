---@type LazySpec
return {
  { import = 'astrocommunity.pack.html-css' },
  {
    'williamboman/mason-lspconfig.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require('astrocore').list_insert_unique(opts.ensure_installed or {}, { 'unocss' })
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require('astrocore').list_insert_unique(opts.ensure_installed or {}, { 'unocss-language-server' })
    end,
  },
}
