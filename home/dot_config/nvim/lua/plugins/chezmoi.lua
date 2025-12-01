--- Same as `astrocommunity.pack.chezmoi` but without `xvzc/chezmoi.nvim` as we don't need
--- automatic `chezmoi apply`.

---@type LazySpec
return {
  { import = 'astrocommunity.pack.toml' },
  {
    'alker0/chezmoi.vim',
    lazy = false,
    specs = {
      {
        'AstroNvim/astrocore',
        opts = {
          options = {
            g = {
              ['chezmoi#use_tmp_buffer'] = 1,
              ['chezmoi#source_dir_path'] = os.getenv 'HOME' .. '/.local/share/chezmoi/home',
            },
          },
        },
      },
    },
  },
}
