return {
  'stevearc/resession.nvim',
  specs = {
    'AstroNvim/astrocore',
    opts = function(_, opts)
      local maps = opts.mappings

      local prefix = '<Leader>s'
      local old_prefix = '<Leader>S'
      for _, key in ipairs { '', 'l', 's', 'S', 't', 'd', 'D', 'f', 'F', '.' } do
        maps.n[prefix .. key] = maps.n[old_prefix .. key]
        maps.n[old_prefix .. key] = false
      end
    end,
  },
}
