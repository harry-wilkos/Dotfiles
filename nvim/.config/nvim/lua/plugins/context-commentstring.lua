return {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
        require('ts_context_commentstring').setup({
            enable_autocmd = false,
        })
        vim.filetype.get_option = function(filetype, option)
          return option == "commentstring"
            and require("ts_context_commentstring.internal").calculate_commentstring()
            or get_option(filetype, option)
        end
    end

}
