---@type LazySpec
return {
  'AstroNvim/astrotheme',
  opts = {
    highlights = {
      astrodark = {
        -- Like `Comment`, but without italic to make it easier to read.
        ['CommentNormal'] = { fg = '#696c76' },
        ['SnacksPickerDir'] = 'CommentNormal',
      },
    },
  },
}
