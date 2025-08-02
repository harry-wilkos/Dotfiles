
return {
    'nvim-lualine/lualine.nvim',
    enabled = vim.o.laststatus ~= 0,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'bwpge/lualine-pretty-path',
    },
        config = function()
            local function hl(name)
              return string.format("#%06x", vim.api.nvim_get_hl(0, { name = name })["fg"])
            end

            local function encoding_only_if_not_utf8()
                local encoding = vim.opt.fileencoding:get()
                if encoding ~= "utf-8" then
                    return encoding
                end
                return ""
            end
                vim.api.nvim_set_hl(0, "LualineRecording", {
                  fg   = hl("red"),
                  bold = true,
                })
            require('lualine').setup({
            options = { theme = {
                  normal = {
                    a = {bg = hl("grey"), fg = hl("fg"), gui = 'bold'},
                    b = {bg = hl("bg_alt"), fg = hl("fg")},
                    c = {bg = nil, fg = hl("grey")}
                  },
                  insert = {
                    a = {bg = hl("green"), fg = hl("fg"), gui = 'bold'},
                    b = {bg = hl("bg_alt"), fg = hl("fg")},
                    c = {bg = nil, fg = hl("grey")}
                  },
                  visual = {
                    a = {bg = hl("bg_highlight"), fg = hl("bg"), gui = 'bold'},
                    b = {bg = hl("bg_alt"), fg = hl("fg")},
                    c = {bg = nil, fg = hl("grey")}
                  },
                  replace = {
                    a = {bg = hl("red"), fg = hl("bg"), gui = 'bold'},
                    b = {bg = hl("bg_alt"), fg = hl("fg")},
                    c = {bg = nil, fg = hl("grey")}
                  },
                  command = {
                    a = {bg = hl("yellow"), fg = hl("bg"), gui = 'bold'},
                    b = {bg = hl("bg_alt"), fg = hl("fg")},
                    c = {bg = nil, fg = hl("grey")}
                  },
                },
        globalstatus = true,
        disabled_filetypes = { statusline = { "snacks_dashboard"}},
        section_separators = { left = "", right = "" },
        component_separators = { right = '', left = '' },
            },
        sections = {
				            lualine_a = {
				                {"mode", seperator = { left = " ", right = "" },}
				            },
				            lualine_b = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
                        separator = ""

					},
                    {
					"filename",
                        padding = {left = 0, right = 1},
                        symbols = {
                            modified = "󰷈",
                            readonly = "󰈡",
                            newfile = "󰝒",
                            unnamed = "󰡯"


                        }

                    }
				},
				lualine_c = {
					{
						"branch",
						icon = "",
                        separator = ""
					},
                    {
                        function() return ' %#LualineRecording#Recording Slot ' .. vim.fn.reg_recording():upper() end,
                        cond = function() return vim.fn.reg_recording() ~= '' end,
                        separator = '',
                        padding = 0,
                    },
                    {
                        function() return "%=" end,
                        separator = "",
                    },

                    {
                        'diagnostics',
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                        separator = '',
                        always_visible = false,
                        update_in_insert = true,
                        colored = true
                    },
            },
                lualine_x = {
                      {
                         encoding_only_if_not_utf8 
                            },


    {
      "diff",
      symbols = {
        added = " ",
        modified = " ",
        removed = " ",
      },
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
        return nil  -- important to return nil if no diff info
      end,
    },
                'lsp_status',
                }
            }
        })

    end,
}
