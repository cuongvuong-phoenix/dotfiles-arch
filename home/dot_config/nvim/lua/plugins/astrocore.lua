---@type LazySpec
return {
  'AstroNvim/astrocore',
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      diagnostics = { virtual_text = false }, -- TODO: keymap to toggle this
    },
    filetypes = {
      pattern = {
        ['%.env%.[%w_.-]+'] = 'sh',
      },
    },
    options = {
      opt = { -- vim.opt.<key>
        clipboard = '', -- See `polish.lua`
      },
    },
    mappings = {
      n = {
        -- Split navigations
        ['<C-S-h>'] = { '<C-W>H', desc = 'Move pane to far left' },
        ['<C-S-l>'] = { '<C-W>L', desc = 'Move pane to far right' },
        ['<C-S-j>'] = { '<C-W>J', desc = 'Move pane to far bottom' },
        ['<C-S-k>'] = { '<C-W>K', desc = 'Move pane to far top' },

        -- Navigate buffer like tabs
        ['t'] = { desc = 'Navigate buffers like tabs' },
        ['tl'] = { function() require('astrocore.buffer').nav(vim.v.count1) end, desc = 'Next buffer' },
        ['th'] = { function() require('astrocore.buffer').nav(-vim.v.count1) end, desc = 'Previous buffer' },
        ['t]'] = { function() require('astrocore.buffer').move(vim.v.count1) end, desc = 'Move buffer tab right' },
        ['t['] = { function() require('astrocore.buffer').move(-vim.v.count1) end, desc = 'Move buffer tab left' },

        ['<Leader>bd'] = {
          function()
            require('astroui.status.heirline').buffer_picker(
              function(bufnr) require('astrocore.buffer').close(bufnr) end
            )
          end,
          desc = 'Close buffer from tabline',
        },

        -- Qualities of life
        ['<M-s>'] = { ':noa w<CR>', desc = 'Save without format' }, -- Don't know why `<M-C-s>` isn't recognized...
        -- TODO: Add multi-cursor above & below
      },
    },
  },
}
