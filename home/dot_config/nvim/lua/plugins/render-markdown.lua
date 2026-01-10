---@type LazySpec
return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ft = { 'markdown' },
  specs = {
    'AstroNvim/astrocore',
    opts = {
      mappings = {
        n = {
          ['<Leader>rm'] = {
            function() require('render-markdown').toggle() end,
            desc = 'Toggle render markdown',
          },
        },
      },
    },
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    enabled = false, -- disable by default
    render_modes = true,
  },
}
