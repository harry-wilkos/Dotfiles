local colours = {
    "red",
    "yellow",
    "blue",
    "orange",
    "green",
    "magenta",
    "cyan"
}
return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local hooks = require("ibl.hooks")
	        require("ibl").setup { scope = { highlight = colours } }
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("rainbow-delimiters.setup").setup({
                highlight = colours
            })
        end,
    },
}

