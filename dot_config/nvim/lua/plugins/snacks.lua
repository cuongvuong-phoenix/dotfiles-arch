---@type LazySpec
return {
  'folke/snacks.nvim',
  specs = {
    {
      'AstroNvim/astrocore',
      opts = {
        mappings = {
          n = {
            ['<C-p>'] = {
              function()
                require('snacks').picker.files {
                  hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat '.git' or {}, 'type') == 'directory',
                }
              end,
              desc = 'Find files',
            },
            -- TODO: Disable notification (can't do for now...)
            ['<Leader>z'] = {
              function() require('snacks').toggle.zoom():toggle() end,
              desc = 'Toggle zoom mode',
            },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local get_icon = require('astroui').get_icon

    return require('astrocore').extend_tbl(opts, {
      -- ======== Dashboard ========
      dashboard = {
        preset = {
          keys = {
            { key = 'n', action = '<Leader>n', icon = get_icon('FileNew', 0, true), desc = 'New File  ' },
            { key = 'f', action = '<Leader>ff', icon = get_icon('Search', 0, true), desc = 'Find File  ' },
            { key = 'o', action = '<Leader>fo', icon = get_icon('DefaultFile', 0, true), desc = 'Recents  ' },
            { key = 'w', action = '<Leader>fw', icon = get_icon('WordFile', 0, true), desc = 'Find Word  ' },
            { key = "'", action = "<Leader>f'", icon = get_icon('Bookmarks', 0, true), desc = 'Bookmarks  ' },
            { key = 's', action = '<Leader>sl', icon = get_icon('Refresh', 0, true), desc = 'Last Session  ' },
          },
          header = [[
     ██████╗██╗   ██╗ ██████╗ ███╗   ██╗ ██████╗      
    ██╔════╝██║   ██║██╔═══██╗████╗  ██║██╔════╝      
    ██║     ██║   ██║██║   ██║██╔██╗ ██║██║  ███╗     
    ██║     ██║   ██║██║   ██║██║╚██╗██║██║   ██║     
    ╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║╚██████╔╝     
     ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝      
                                                      
██████╗ ██╗  ██╗ ██████╗ ███████╗███╗   ██╗██╗██╗  ██╗
██╔══██╗██║  ██║██╔═══██╗██╔════╝████╗  ██║██║╚██╗██╔╝
██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║██║ ╚███╔╝ 
██╔═══╝ ██╔══██║██║   ██║██╔══╝  ██║╚██╗██║██║ ██╔██╗ 
██║     ██║  ██║╚██████╔╝███████╗██║ ╚████║██║██╔╝ ██╗
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝]],
        },

        -- sections = {
        --   { section = 'header' },
        --   { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        --   { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        --   { section = 'startup' },
        -- },
      },

      -- ======== Zen ========
      toggle = {
        which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
        notify = true, -- show a notification when toggling
        -- icons for enabled/disabled states
        icon = {
          enabled = ' ',
          disabled = ' ',
        },
        -- colors for enabled/disabled states
        color = {
          enabled = 'green',
          disabled = 'yellow',
        },
        wk_desc = {
          enabled = 'Disable ',
          disabled = 'Enable ',
        },
      },

      -- ======== Zen ========
      ---@class snacks.zen.Config
      zen = {
        on_open = function(_) end, -- Keep indent as AstroNvim removed it
        on_close = function(_) end, -- Keep indent as AstroNvim removed it

        zoom = {
          ---@type snacks.win.Config
          win = {
            backdrop = 60,
            wo = {
              number = true,
              relativenumber = true,
              signcolumn = 'yes',
              foldcolumn = '1',
            },
          },
        },
      },
    })
  end,
}
