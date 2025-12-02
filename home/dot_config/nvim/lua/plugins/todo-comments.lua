---@type LazySpec
return {
  'folke/todo-comments.nvim',
  opts = {
    highlight = {
      -- NOTE: Only highlight when having at least 1 space character to avoid highlighting normal code right-below.
      --   It's also a good practice when grouping TODO comments like that for easier reading/skimming.
      multiline_pattern = '^%s.',
    },
  },
}
