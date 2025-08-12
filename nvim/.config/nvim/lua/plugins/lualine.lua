return {
	"nvim-lualine/lualine.nvim",
	enabled = vim.o.laststatus ~= 0,
	dependencies = { "nvim-tree/nvim-web-devicons", "bwpge/lualine-pretty-path" },
	config = function()
		local function hl(name)
			return string.format("#%06x", vim.api.nvim_get_hl(0, { name = name })["fg"])
		end

		local function encoding_only_if_not_utf8()
			local encoding = vim.opt.fileencoding:get()
			if encoding ~= "utf-8" then
				return encoding
			end
			return ""
		end

		local function link()
			local buf = vim.api.nvim_get_current_buf()

			local lsp_clients = vim.lsp.get_clients({ bufnr = buf })
			local formatters = require("conform").list_formatters_to_run(buf)
			local linters = require("lint").get_running()

			local parts = {}

			if #lsp_clients > 0 then
				local names = {}
				for _, client in ipairs(lsp_clients) do
					table.insert(names, client.name)
				end
				table.insert(parts, "🗨️ " .. table.concat(names, " "))
			end

			if #formatters > 0 then
				local names = {}
				for _, fmt in ipairs(formatters) do
					table.insert(names, fmt.name)
				end
				table.insert(parts, " " .. table.concat(names, " "))
			end

			if #linters > 0 then
				table.insert(parts, "󰘉 " .. table.concat(linters, " "))
			end

			return table.concat(parts, " ")
		end

		vim.api.nvim_set_hl(0, "LualineRecording", { fg = hl("red"), bold = true })
		require("lualine").setup({
			options = {
				theme = {
					normal = {
						a = { bg = hl("grey"), fg = hl("fg"), gui = "bold" },
						b = { bg = hl("bg_alt"), fg = hl("fg") },
						c = { bg = nil, fg = hl("grey") },
					},
					insert = {
						a = { bg = hl("green"), fg = hl("fg"), gui = "bold" },
						b = { bg = hl("bg_alt"), fg = hl("fg") },
						c = { bg = nil, fg = hl("grey") },
					},
					visual = {
						a = {
							bg = hl("bg_highlight"),
							fg = hl("bg"),
							gui = "bold",
						},
						b = { bg = hl("bg_alt"), fg = hl("fg") },
						c = { bg = nil, fg = hl("grey") },
					},
					replace = {
						a = { bg = hl("red"), fg = hl("bg"), gui = "bold" },
						b = { bg = hl("bg_alt"), fg = hl("fg") },
						c = { bg = nil, fg = hl("grey") },
					},
					command = {
						a = { bg = hl("yellow"), fg = hl("bg"), gui = "bold" },
						b = { bg = hl("bg_alt"), fg = hl("fg") },
						c = { bg = nil, fg = hl("grey") },
					},
				},
				globalstatus = true,
				disabled_filetypes = { statusline = { "snacks_dashboard" } },
				section_separators = { left = "", right = "" },
				component_separators = { right = "", left = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", seperator = { left = " ", right = "" } },
				},
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
						separator = "",
					},
					{
						"filename",
						padding = { left = 0, right = 1 },
						symbols = {
							modified = "󰷈",
							readonly = "󰈡",
							newfile = "󰝒",
							unnamed = "󰡯",
						},
					},
				},
				lualine_c = {
					{ "branch", icon = "" },
					{ encoding_only_if_not_utf8 },
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						colored = false,
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
							return nil -- important to return nil if no diff info
						end,
					},
				},
				lualine_x = {

					{
						function()
							return "%#LualineRecording#Recording Slot "
								.. vim.fn.reg_recording():upper()
								.. " %#grey#"
						end,
						cond = function()
							return vim.fn.reg_recording() ~= ""
						end,
						separator = "",
						padding = 0,
					},
					{
						"diagnostics",
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
						always_visible = false,
						update_in_insert = true,
						colored = false,
					},
					{ link },
					-- "lsp_status",
				},
			},
		})
	end,
}
