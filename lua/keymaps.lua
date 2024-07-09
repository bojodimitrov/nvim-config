-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Custom remaps
-- vim.keymap.set('v', '<leader>p', "\"_dP")
vim.keymap.set('n', 'E', 'ea')
vim.keymap.set('n', '<C-,>', '<C-.>')
vim.keymap.set('n', '<C-.>', '<leader>ca')

-- vim.keymap.set('n', '<leader>p', '"_dp')
-- vim.keymap.set('n', '<leader>P', '"_dP')
-- vim.keymap.set('v', '<leader>p', '"_dp')
-- vim.keymap.set('v', '<leader>P', '"_dP')

vim.keymap.set('n', 'p', '"0p')
vim.keymap.set('n', 'P', '"0P')
vim.keymap.set('v', 'p', '"0p')
vim.keymap.set('v', 'P', '"0P')
vim.keymap.set('n', 'd', '"0d')
vim.keymap.set('v', 'd', '"0d')
vim.keymap.set('n', 'D', '"0D')
vim.keymap.set('n', 'x', '"0x')
vim.keymap.set('n', 'X', '"0X')

-- vim.keymap.set('n', '<leader>y', '"+y')
-- vim.keymap.set('v', '<leader>y', '"+y')
-- vim.keymap.set('n', '<leader>Y', '"+y')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('n', 'J', '5jzz')
vim.keymap.set('n', 'K', '5kzz')
vim.keymap.set('v', 'J', '5jzz')
vim.keymap.set('v', 'K', '5kzz')

vim.keymap.set('n', '<leader>gs', '<Cmd>LazyGit<CR>')

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '>-2<CR>gv=gv")

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', 'gg', 'ggzz')

vim.keymap.set('n', 'mh', '<C-w>h')
vim.keymap.set('n', 'ml', '<C-w>l')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', '<C-s>', ':w<Enter>', { noremap = true, silent = true })

vim.keymap.set('i', '<C-s>', '<Esc>:w<Enter>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
vim.keymap.set('n', '<A-[>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<A-]>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.keymap.set('n', '<A-\\>', '<Cmd>BufferClose<CR>', opts)

local pass_args = function(func, ...)
  local args = { ... }
  return function()
    func(unpack(args))
  end
end

vim.keymap.set('n', '<Leader>tf',
  pass_args(require('nvim-tree.api').tree.find_file, { update_root = true, open = true, focus = true, }),
  { desc = 'Open nvim-[T]ree [F]ind file' })
vim.keymap.set('n', '<Leader>ts', require('nvim-tree.api').tree.open, { desc = 'Open nvim-[T]ree Focu[S]' })
vim.keymap.set('n', '<Leader>tc', require('nvim-tree.api').tree.close, { desc = 'Open nvim-[T]ree [C]lose' })

vim.keymap.set('n', '<leader>ir', "iimport * as React from 'react'<Esc>")

vim.keymap.set('n', '<leader>wf', 'i{return }<Esc>x%p%', { desc = 'Wrap function return statement into body block' })
