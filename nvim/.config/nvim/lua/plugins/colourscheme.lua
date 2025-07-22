return {
    {
      "tanvirtin/monokai.nvim",
      config = function()
	    require('monokai').setup {
		palette = {
		}
	    }
      end
    },
    {
    "xiyaowong/transparent.nvim",
    config = function()
	vim.cmd("TransparentEnable")	
    end
    },
}
