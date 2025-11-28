---@type LazySpec
return {
  'lewis6991/gitsigns.nvim',
  opts = function(_, opts)
    opts.current_line_blame = true

    opts.on_attach = require('astrocore').patch_func(opts.on_attach, function(original_on_attach, bufnr)
      -- Run default `on_attach()` of AstroNvim
      original_on_attach(bufnr)

      -- Custom configs
      local astrocore = require 'astrocore'
      local maps = astrocore.empty_map_table()

      -- Easier than `]g`...
      maps.n[']c'] = { function() require('gitsigns').nav_hunk 'next' end, desc = 'Next change (Git)' }
      maps.n[']C'] = { function() require('gitsigns').nav_hunk 'last' end, desc = 'Last change (Git)' }
      maps.n['[c'] = { function() require('gitsigns').nav_hunk 'prev' end, desc = 'Previous change (Git)' }
      maps.n['[C'] = { function() require('gitsigns').nav_hunk 'first' end, desc = 'First change (Git)' }

      -- `g` keys
      maps.n['gB'] = {
        function() require('gitsigns').blame_line() end,
        desc = 'Hover Git blame of current line',
      }

      -- UI
      maps.n['<Leader>uG'] = {
        function() require('gitsigns').toggle_current_line_blame() end,
        desc = 'Toggle current line Git Blame',
      }

      astrocore.set_mappings(maps, { buffer = bufnr })
    end)
  end,
}
