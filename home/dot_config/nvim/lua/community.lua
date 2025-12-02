-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
--
-- NOTE: Modules are located at: ~/.local/share/nvim/lazy/astrocommunity/lua/astrocommunity/*

---@type LazySpec
return {
  'AstroNvim/astrocommunity',
  -- Extras
  { import = 'astrocommunity.utility.noice-nvim' },
  { import = 'astrocommunity.comment.ts-comments-nvim' },
  -- Languages
  { import = 'astrocommunity.pack.lua' },
  { import = 'astrocommunity.pack.toml' },
  { import = 'astrocommunity.pack.yaml' },
  { import = 'astrocommunity.pack.json' },
  { import = 'astrocommunity.pack.just' },
  { import = 'astrocommunity.pack.markdown' },

  { import = 'astrocommunity.pack.html-css' },
  { import = 'astrocommunity.pack.tailwindcss' },
  { import = 'astrocommunity.pack.typescript-all-in-one' },
  { import = 'astrocommunity.pack.vue' },
  { import = 'astrocommunity.pack.eslint' },

  { import = 'astrocommunity.pack.rust' },

  { import = 'astrocommunity.pack.sql' },
}
