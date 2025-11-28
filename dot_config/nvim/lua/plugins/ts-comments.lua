---@type LazySpec
return {
  'folke/ts-comments.nvim',
  specs = {
    {
      'AstroNvim/astrocore',
      opts = function(_, opts)
        local maps = opts.mappings

        -- TODO: Keep previous cursor position
        -- NOTE: Within Tmux, `<C-/>` is recognized as `<C-_>`
        for _, key in ipairs { '<C-/>', '<C-_>' } do
          maps.x[key] = { 'gc', desc = 'Toggle comment', remap = true }
          maps.n[key] = { 'gcc', desc = 'Toggle comment line', remap = true }
          maps.i[key] = { '<Esc>gcc', desc = 'Toggle comment line', remap = true }
        end
      end,
    },
  },
}
