return {{

    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
	require("cyberdream").setup({
	    transparent = true,
	    italic_comments = true,
	    saturation = 1,
	colors = {
	  bg             = "#002635",   -- bg (main background)
	  bg_alt         = "#004763",   -- bg_tab (alt/border/tab background)
	  bg_highlight   = "#00cccc",   -- cyan (accent/highlight)
	  fg             = "#e6e6dc",   -- fg (main foreground)
	  grey           = "#517f8d",   -- grey (dim/muted text tone)
	  blue           = "#12ade0",   -- blue (vibrant)
	  green          = "#7fc06e",   -- green (natural tone)
	  cyan           = "#00ffff",   -- cyan_light (brighter accent)
	  red            = "#ff5a67",   -- red (vivid red)
	  yellow         = "#ffcc1b",   -- yellow (strong highlight)
	  magenta        = "#c694ff",   -- pink (mapped to magenta)
	  pink           = "#fb94ff",   -- pink_light (softer/paler tone)
	  orange         = "#f08e48",   -- orange (warm accent)
	  purple         = "#b7cff9",   -- grey_light (soft, cool purple tone)
	}	})
	vim.cmd("colorscheme cyberdream")
    end
}
}

