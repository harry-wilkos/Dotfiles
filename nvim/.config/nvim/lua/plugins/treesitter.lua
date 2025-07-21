return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      require("nvim-treesitter.configs").setup({
	ensure_installed = {"bash", "lua", "regex", "markdown", "markdown_inline"},
	auto_install = true,
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	}

        })
    end
 }
