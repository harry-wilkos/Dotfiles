local highlight = {
    "RainbowRed",
    "RainbowOrange",
    "RainbowYellow",
    "RainbowGreen",
    "RainbowCyan",
    "RainbowBlue",
    "RainbowViolet",
}

return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#f92672" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f4bf75" })
                vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#66d9ef" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fd971f" })
                vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#a6e22e" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#ae81ff" })
                vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#a1efe4" })
            end)

            require("ibl").setup({
                scope = { highlight = highlight },
            })

            hooks.register(
                hooks.type.SCOPE_HIGHLIGHT,
                hooks.builtin.scope_highlight_from_extmark
            )
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("rainbow-delimiters.setup").setup({
                highlight = highlight,
            })
        end,
    },
}

