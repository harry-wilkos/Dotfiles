return {
	-- dir = "~/Projects/link",
    "harry-wilkos/Link.Nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"stevearc/conform.nvim",
		"zapling/mason-conform.nvim",
		"mfussenegger/nvim-lint",
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		require("link").setup({
			clean = true,
			lsps = { limit = 1, lua = { include = { "lua_ls" } } },
			formatters = {
				limit = 2,
				python = { include = { "isort" } },

				fish = { include = { "fish_indent" } },
			},
			linters = { limit = 1 },
		})
	end,
}
