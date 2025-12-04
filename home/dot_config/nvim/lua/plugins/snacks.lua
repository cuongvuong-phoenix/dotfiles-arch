---@type LazySpec
return {
  'folke/snacks.nvim',
  specs = {
    {
      'AstroNvim/astrocore',
      opts = function(_, opts)
        local maps = opts.mappings

        -- ======== Zen ========
        -- TODO: Disable notification (can't do for now...)
        maps.n['<Leader>z'] = {
          function() require('snacks').toggle.zoom():toggle() end,
          desc = 'Toggle zoom mode',
        }

        -- ======== Picker ========
        maps.n['<C-p>'] = {
          function()
            require('snacks').picker.files {
              hidden = vim.tbl_get((vim.uv or vim.loop).fs_stat '.git' or {}, 'type') == 'directory',
              matcher = {
                frecency = true,
                history_bonus = true,
              },
              layout = 'vscode',
            }
          end,
          desc = 'Find files',
        }
        -- Git
        if vim.fn.executable 'git' == 1 then
          maps.n['<Leader>gc'] = { desc = 'Git history' }
          maps.n['<Leader>gcr'] =
            { function() require('snacks').picker.git_log() end, desc = 'Git history (Repository)' }
          maps.n['<Leader>gcf'] =
            { function() require('snacks').picker.git_log_file() end, desc = 'Git history (File)' }
          maps.n['<Leader>gcl'] =
            { function() require('snacks').picker.git_log_line() end, desc = 'Git history (Line)' }
        end
      end,
    },
  },
  opts = function(_, opts)
    local get_icon = require('astroui').get_icon

    return require('astrocore').extend_tbl(opts, {
      -- ======== Dashboard ========
      ---@class snacks.dashboard.Config
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

      -- ======== Toggle ========
      ---@class snacks.toggle.Config
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

      -- ======== Picker ========
      ---@class snacks.picker.Config
      picker = {
        formatters = {
          file = {
            min_width = 9999, -- Because Snacks is so stupidddd it doesn't have an action to show path on hover like LSP.
          },
        },
        actions = {
          list_scroll_right = function(picker)
            if picker.list.win:valid() then picker.list.win:hscroll() end
          end,
          list_scroll_left = function(picker)
            if picker.list.win:valid() then picker.list.win:hscroll(true) end
          end,
        },
        win = {
          input = {
            keys = {
              ['<C-l>'] = { 'list_scroll_right', mode = { 'n', 'i' } },
              ['<C-h>'] = { 'list_scroll_left', mode = { 'n', 'i' } },
            },
          },
        },
      },
    })
  end,
}
