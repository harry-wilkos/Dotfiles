return {
    "echasnovski/mini.surround",
    config = function()
        require('mini.surround').setup({
            respect_selection_type = true,
             search_method  = "cover_or_next"
        })
    end
}
