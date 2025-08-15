return {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
        require('ts_context_commentstring').setup({
            enable_autocmd = false,
        })

        local original_get_option = vim.filetype.get_option

        vim.filetype.get_option = function(filetype, option)
            if option == "commentstring" then
                return require("ts_context_commentstring.internal").calculate_commentstring()
            end
            return original_get_option(filetype, option)
        end
    end
}
