local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts or {noremap = true, silent = true})
end

vim.g.mapleader = ' '

-- Copy to clipboard
map({'n', 'v'}, '<leader>y', '"+y')
map({'n', 'v'}, '<leader>p', '"+p')
map({'n', 'v'}, '<leader>P', '"+P')
map({'n', 'v'}, '<leader>d', '"+d')

-- Select all
map('n', 'vaa', 'ggVG')

map('n', '<leader><CR>', '<cmd>set hlsearch!<CR>')

-- Keep visual mode after indent
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Switch tabs
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
map('n', '<leader>0', '<cmd>tablast<CR>')

-- Switch panels
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-h>', '<C-w><C-h>')

-- Change window size
map('n', '<Left>', '<C-w>5<')
map('n', '<Right>', '<C-w>5>')
map('n', '<UP>', '<C-w>+')
map('n', '<DOWN>', '<C-w>-')

-- Move lines
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Close current buffer
map('n', '<leader>q', ':bdelete<CR>')

-- Nvim-Tree
map('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')

-- Insert
map('i', '<C-c>', '<Esc>')
map('i', '<A-j>', '<Esc>o')
map('i', '<A-k>', '<Esc>O')

-- Save file
map('n', '<C-s>', '<CMD>write<CR>')
map('i', '<C-s>', '<C-o><cmd>write<CR>')

map('i', ',shrug', [[¯\_(ツ)_/¯]])

map('n', '<leader>we', ':call rh#save_and_exec()<CR>')

-- Terminal
map('t', '<Esc><Esc>', [[<C-\><C-n>]])
map('t', '<C-j>', [[<C-\><C-n><C-w><C-j>]])
map('t', '<C-k>', [[<C-\><C-n><C-w><C-k>]])
map('t', '<C-l>', [[<C-\><C-n><C-w><C-l>]])
map('t', '<C-h>', [[<C-\><C-n><C-w><C-h>]])
