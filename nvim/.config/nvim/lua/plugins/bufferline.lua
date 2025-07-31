return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                themable = true,
                show_duplicate_prefix = true,
                duplicates_across_groups = true,
                auto_toggle_bufferline = true,
                move_wraps_at_ends = false,
                mode = "buffers",
                numbers = "none",
                right_mouse_command = "vert, sbuffer %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {style = "icon"},
                max_name_length = 18,
                max_profile_length = 16,
                truncate_names = true,
                tab_size = 18,
                diagnostics = "nvim_lsp",
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = false,
                show_tab_indicators = true,
                persist_buffer_sort = true,
                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = false,
                hover = {
                    enabled = true, -- requires nvim 0.8+
                    delay = 0,
                    reveal = { "close" },
                },
                sort_by = "id",
                debug = { logging = false },   
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                  local icon = level:match("error") and " " or " "
                  return " " .. icon .. count
                end,
                offsets = {
                    {
                        filetype = "snacks_layout_box",
                        text  = "Explorer",
                        highlighting = "PanelHeading",
                        padding = 1
                    },
                }
            }
        })
    end

}

