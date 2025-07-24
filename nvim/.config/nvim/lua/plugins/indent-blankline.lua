
return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
	    require("ibl").setup { indent = { highlight = {
    "red",
    "yellow",
    "blue",
    "orange",
    "green",
    "magenta",
    "cyan"
} } }
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("rainbow-delimiters.setup").setup({
            })
        end,
    },
}

