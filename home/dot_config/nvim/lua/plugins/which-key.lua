---Hide text-icons of mappings set by `opts._map_sections` within default config of `astrocore`.
---The icons should be automatically detected by which-key's `opts.icons.rules'.
---@param origin_maps table<string, table<string, any?>?>
---@param sections table<string, any>
---@return table
local function fix_map_sections(origin_maps, sections)
  local astro = require 'astrocore'
  local result = astro.empty_map_table()

  for key, val in pairs(sections) do
    local k = '<Leader>' .. key

    result.n[k] = val
    if origin_maps.v[k] then result.v[k] = val end
  end

  return astro.extend_tbl(origin_maps, result)
end

---@type LazySpec
return {
  'folke/which-key.nvim',
  specs = {
    -- Override stupid default icons...
    {
      'AstroNvim/astrocore',
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        opts.mappings = fix_map_sections(opts.mappings, {
          f = { desc = 'Find' },
          p = { desc = 'Packages', icon = { icon = '󰏗', color = 'purple' } },
          l = { desc = 'Language Tools', icon = { icon = '󰢱', color = 'blue' } },
          u = { desc = 'UI/UX' },
          b = { desc = 'Buffers' },
          bs = { desc = 'Sort Buffers' },
          d = { desc = 'Debugger' },
          g = { desc = 'Git' },
          s = { desc = 'Session' },
          t = { desc = 'Terminal' },
          x = { desc = 'Quickfix/Lists' },
          -- Custom
          r = { desc = 'Render/Preview', icon = { icon = '', color = 'cyan' } },
        })
      end,
    },
    {
      'AstroNvim/astrolsp',
      opts = function(_, opts)
        opts.mappings = fix_map_sections(opts.mappings, {
          l = { desc = 'Language Tools', icon = { icon = '󰢱', color = 'blue' } },
          g = { desc = 'Git' },
        })
      end,
    },
  },
  opts = {
    delay = 250,
    preset = 'helix',
    icons = {
      mappings = true,
      rules = {}, -- Enable icons for popular plugins' keymaps
    },
  },
}
