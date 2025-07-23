vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Keep selection when Identing
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

