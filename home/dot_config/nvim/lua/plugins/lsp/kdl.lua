---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    optional = true,
    ---@type AstroCoreOpts
    opts = {
      treesitter = {
        ensure_installed = { "kdl" },
      },
    },
  },
}
