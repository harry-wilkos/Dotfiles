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
vim.keymap.set("n", "<C-S-Del>", ":bd<CR>", opts)
vim.keymap.set("n", "<S-Up>", "{", opts)
vim.keymap.set("n", "<S-Down>", "}", opts)

vim.keymap.set("n", "z<Down>", "zj", opts)
vim.keymap.set("n", "z<Up>", "zk", opts)

vim.keymap.set({ "n", "v" }, "<leader>bf", function()
	require("conform").format({ lsp_format = "fallback" }, function(_, did_edit)
		if did_edit then
			vim.notify("Formatted Buffer", vim.log.levels.INFO)
		end
	end)
end, opts)

vim.keymap.set("n", "<leader>bl", function()
	require("lint").try_lint()
end, opts)

vim.keymap.set("n", "<leader>ba", function()
	vim.lsp.buf.code_action()
end, opts)

vim.keymap.set("n", "<leader>bh", function()
	vim.lsp.buf.hover()
end, opts)

vim.keymap.set("n", "<leader>bd", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable(true)
	end
end, opts)

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)


vim.keymap.set("n", "g/", "*", opts)
vim.keymap.set("n", "[/", "[<C-i>",opts)
vim.keymap.set("x", "/", "<esc>/\\%V",opts)


vim.keymap.set("n", "cn", "*``cgn", opts)
vim.keymap.set("n", "cN", "*``cgN", opts)
