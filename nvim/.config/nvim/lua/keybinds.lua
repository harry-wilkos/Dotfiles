vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = {noremap = true, silent = true}

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', opts)
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeToggle<CR>', opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("n", "<C-a>", "ggVG", opts)
vim.keymap.set('v', '<Del>', '"_d', opts)
vim.keymap.set('n', '<C-S-s>', ':saveas ', { noremap = true, silent = false })      
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)           
vim.keymap.set('i', '<C-S-s>', '<C-o>:saveas ', { noremap = true, silent = false }) 
vim.keymap.set('i', '<C-s>', '<C-o>:w<CR>', opts)      
