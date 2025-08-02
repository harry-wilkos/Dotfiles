return {
    "dstein64/nvim-scrollview",
    config = function()
        local function hl(name)
          return string.format("#%06x", vim.api.nvim_get_hl(0, { name = name })["fg"])
        end

        vim.api.nvim_set_hl(0, "ScrollView", {
            bg = nil,
            fg = hl("bg_highlight")
        })
        vim.api.nvim_set_hl(0, "ScrollViewHover", {
            bg = nil,
            fg = hl("grey")
        })
        require("scrollview").setup(
            {
                base = "right",
                hide_bar_for_insert = true,
                hide_on_text_intersect = true,
                character = "┃"
            }
        )
    end
}
