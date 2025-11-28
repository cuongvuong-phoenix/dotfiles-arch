-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- -------- Use system clipboard for yank operations --------
vim.keymap.set({ 'n', 'v' }, 'y', '"+y', { desc = 'Yank {motion}/highlighted text into system clipboard' })
vim.keymap.set('n', 'Y', '"+y$', { desc = 'Yank text from cursor to the end of line into system clipboard' })
vim.keymap.set('v', 'Y', 'V"+y', { desc = 'Yank highlighted lines into system clipboard' })
-- Emulate system clipboard shortcuts
--   Consistent cursor position after putting in all three modes (i.e. like pasting in a regular <input>)
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy into system clipboard' })
vim.keymap.set('v', '<C-x>', '"+x', { desc = 'Cut into system clipboard' })
vim.keymap.set('v', '<C-v>', '"+gp', { desc = 'Put from system clipboard (Visual)' })
vim.keymap.set('n', '<C-v>', '"+gP', { desc = 'Put from system clipboard (Normal)' })
-- PERF: RHS for the shortcut in Command mode can be reused for Insert mode, but `<C-r>+` basically
-- mimics `Ctrl + Shift + V`, so it's VERY VERY VERY SLOW compared to `:put` (because it's inputting
-- char-by-char!).
vim.keymap.set('i', '<C-v>', '<Esc>"+pa', { desc = 'Put from system clipboard (Insert)' })
vim.keymap.set('c', '<C-v>', '<C-r>+', { desc = 'Put from system clipboard (Command)' })
