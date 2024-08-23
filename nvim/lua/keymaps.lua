-- Keymap
-- vim.keymap.set('n', '<leader>pv', vim.cmd('Explore'))
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')


vim.keymap.set('x', '<leader>p', '\'_dP')

vim.keymap.set('n', '<leader>y', '\'+y')
vim.keymap.set('v', '<leader>y', '\'+y')
vim.keymap.set('n', '<leader>Y', '\'+Y')

vim.keymap.set('n', '<leader>d', '\'_d')
vim.keymap.set('v', '<leader>d', '\'_d')

-- CTRL-S for saving
vim.keymap.set('i', '<C-s>', '<ESC>:w<ENTER>a')
vim.keymap.set('n', '<C-s>', '<ESC>:w<ENTER>')

-- Shift-Insert paste from Clipboard
vim.keymap.set('i', '<S-Insert>', '<ESC>"+pa')
vim.keymap.set('n', '<S-Insert>', '"+p')
vim.keymap.set('c', '<S-Insert>', '<C-R>+')

vim.keymap.set('n', 'Q', '<nop>')


-- Settings 
vim.g.mapleader     = ' '

vim.keymap.set('n', '<F5>', ':DapContinue<CR>')
vim.keymap.set('n', '<F9>', ':DapToggleBreakpoint<CR>')
vim.keymap.set('n', '<F10>', ':DapStepOver<CR>')
vim.keymap.set('n', '<F11>', ':DapStepInto<CR>')