---@type LazySpec
return {
  'folke/noice.nvim',
  opts = {
    presets = {
      bottom_search = false, -- Can see number of matched in real-time
      lsp_doc_border = true,
    },
    lsp = {
      progress = {
        enabled = false, -- Astro's statusline (using `heirline`) already showed this
      },
      hover = {
        silent = true, -- Very noisy when running in a TypeScript project
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '', -- See `:h ui-messages`
          find = 'fewer line',
        },
        opts = { skip = true },
      },
      -- Hide search count Virtual Text as it's closing on `:noh`
      {
        filter = {
          event = 'msg_show',
          kind = 'search_count',
        },
        opts = { skip = true },
      },
    },
  },
}
