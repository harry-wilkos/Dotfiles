return {
  "echasnovski/mini.ai",
  dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,        
          lookahead = true,     
          keymaps = {
            ["af"] = "@function.outer",  
            ["if"] = "@function.inner",  
            ["ac"] = "@class.outer",     
            ["ic"] = "@class.inner",     
          },
        },
      },
    })

    local ai = require("mini.ai")
    ai.setup({
      n_lines = 500,  
      custom_textobjects = {
        -- 'o': blocks (like loops, conditionals) using Treesitter captures
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" }, 
          i = { "@block.inner", "@conditional.inner", "@loop.inner" }, 
        }),

        -- 'f': functions (inner and outer)
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),

        -- 'c': classes (inner and outer)
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),

        -- 't': html/xml tags (match opening and closing tags)
        t = {
          "<([%p%w]-)%f[^<%w][^<>]->.-</%1>",
          "^<.->().*()</[^/]->$"
        },

        -- 'd': digits (numbers)
        d = { "%f[%d]%d+" },

        -- 'e': words with specific casing (camelCase, PascalCase, etc.)
        e = {
          {
            "%u[%l%d]+%f[^%l%d]",
            "%f[%S][%l%d]+%f[^%l%d]",
            "%f[%P][%l%d]+%f[^%l%d]",
            "^[%l%d]+%f[^%l%d]",
          },
          "^().*()$",
        },

        -- 'u': function calls, using mini.ai generator
        u = ai.gen_spec.function_call(),

        -- 'U': function calls where function name is just word characters (no dot)
        U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
      },
    })
  end,
}
