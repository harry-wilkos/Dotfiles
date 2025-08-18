return {
	"folke/trouble.nvim",
	config = function()
		vim.keymap.set(
			"n",
			"<Leader>l",
			"<cmd>Trouble cascade<cr><cmd>Trouble cascade jump<cr><cmd>Trouble cascade focus<cr>",
			{ desc = "Cascade Diagnostics (Trouble)" }
		)
		vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
		vim.keymap.set(
			"n",
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>",
			{ desc = "LSP Definitions / references / ... (Trouble)" }
		)

		require("trouble").setup({
			modes = {
				cascade = {
					mode = "diagnostics",
					filter = function(items)
						local cur = vim.api.nvim_get_current_buf()
						local cur_name = vim.api.nvim_buf_get_name(cur)

						-- only items from current buffer
						local buf_items = vim.tbl_filter(function(it)
							if it.bufnr then
								return it.bufnr == cur
							end
							return it.filename and cur_name ~= "" and it.filename == cur_name
						end, items)

						if vim.tbl_isempty(buf_items) then
							return {}
						end

						-- find min severity among those items
						local severity = vim.diagnostic.severity.HINT
						for _, it in ipairs(buf_items) do
							severity = math.min(severity, it.severity)
						end

						-- return only items from current buffer with that severity
						return vim.tbl_filter(function(it)
							local same_buf = (it.bufnr and it.bufnr == cur) or (it.filename and it.filename == cur_name)
							return same_buf and it.severity == severity
						end, buf_items)
					end,
				},
			},


			open_no_results = true,
			warn_no_results = false,
			auto_preview = false,
			focus = true,
			pinned = true,
		})
	end,
}
