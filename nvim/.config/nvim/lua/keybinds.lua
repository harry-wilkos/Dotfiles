vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "gc", function()
	return require("vim._comment").operator() .. "gv"
end, { expr = true, noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", opts)
vim.keymap.set("v", "<Del>", '"_d', opts)
vim.keymap.set("n", "<S-Del>", "i<BS><Esc>", opts)
vim.keymap.set("i", "<S-Del>", "<BS>", opts)

vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("v", "c", '"_c', opts)
vim.keymap.set("n", "<C-S-s>", ":saveas ", { noremap = true, silent = false })
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-S-s>", "<C-o>:saveas ", { noremap = true, silent = false })
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>", opts)
vim.keymap.set("n", "/", ":noh<CR>/", opts)
vim.keymap.set("n", "<C-Tab>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<C-S-Del>", ":bd<CR>", opts)

vim.keymap.set('n', 'z<Down>', 'zj', opts)
vim.keymap.set('n', 'z<Up>', 'zk', opts)

