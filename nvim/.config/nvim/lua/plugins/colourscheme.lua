colors = {
	  bg             = "#002635",   
      bg_alt         = "#004763",   
	  bg_highlight   = "#75D7CB",   
	  fg             = "#e6e6dc",  
	  grey           = "#517f8d",   
	  blue           = "#12ade0",   
	  green          = "#7fc06e",   
	  cyan           = "#00ffff",   
	  red            = "#ff5a67",  
	  yellow         = "#ffcc1b",   
	  magenta        = "#c694ff",   
	  pink           = "#fb94ff",   
	  orange         = "#f08e48",   
	  purple         = "#b7cff9",   
}

return {{
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
	for name, hex in pairs(colors) do
	    vim.api.nvim_set_hl(0, name, { fg = hex})
	end 
	require("cyberdream").setup({
	    transparent = true,
	    italic_comments = true,
	    saturation = 1,
	    colors = colors
		})
	vim.cmd("colorscheme cyberdream")
    end
}
}

