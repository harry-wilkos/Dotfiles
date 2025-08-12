return {
    'saghen/blink.cmp',
    version = '1.*',
    config = function()
        require("blink.cmp").setup({
            completion = {
                menu = {
                    border = "rounded",
                }
            },
        })
    end
}
