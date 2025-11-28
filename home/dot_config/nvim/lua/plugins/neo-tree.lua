---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  specs = {
    {
      'AstroNvim/astrocore',
      opts = {
        mappings = {
          n = {
            ['<C-b>'] = { ':Neotree toggle<CR>', desc = 'Toggle Explorer' },
            ['<C-S-E>'] = { ':Neotree reveal<CR>', desc = 'Reveal and Focus Explorer' },
          },
        },
      },
    },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        never_show = {
          '.git',
        },
      },
      follow_current_file = {
        leave_dirs_open = true,
      },
      window = {
        mappings = {
          ['<C-b>'] = 'close_window',

          -- Collapse/Expand subfolders
          ['z'] = {
            'show_help',
            nowait = false,
            config = { title = 'Collapse/Expand subfolders', prefix_key = 'z' },
          },
          ['zM'] = { 'close_all_subnodes', desc = 'Collapse all subnodes', nowait = false },
          ['zO'] = { 'expand_all_subnodes', desc = 'Expand all subnodes', nowait = false },

          -- Open in split panes
          ['s'] = {
            'show_help',
            nowait = false,
            config = { title = 'Open in a splited pane', prefix_key = 's' },
          },
          ['s-'] = { 'open_split', desc = 'Split horizontally', nowait = false },
          ['s_'] = { 'open_vsplit', desc = 'Split vertically', nowait = false },

          -- Order by
          ['on'] = { 'order_by_name', desc = 'name', nowait = false },
          ['os'] = { 'order_by_size', desc = 'size', nowait = false },
          ['ot'] = { 'order_by_type', desc = 'type', nowait = false },
          ['oc'] = { 'order_by_created', desc = 'created date', nowait = false },
          ['om'] = { 'order_by_modified', desc = 'modified date', nowait = false },
          ['og'] = { 'order_by_git_status', desc = 'git status', nowait = false },
          ['od'] = { 'order_by_diagnostics', desc = 'diagnostics', nowait = false },

          ['<Tab>'] = 'show_file_details', -- Mimic Yazi

          ['P'] = 'toggle_preview',
          ['L'] = 'focus_preview',

          -- Unset
          ['w'] = false,
          ['b'] = false,
          ['<C-f>'] = false,
        },

        fuzzy_finder_mappings = {
          ['<esc>'] = 'noop',
        },
      },
    },
  },
}
