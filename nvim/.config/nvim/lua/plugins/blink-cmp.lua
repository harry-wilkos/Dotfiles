return {
    "saghen/blink.cmp",
    dependencies = {"xzbdmw/colorful-menu.nvim", "folke/lazydev.nvim"},
    version = "1.*",
    opts_extend = {"sources.default"},
    config = function()
        local has_words_before = function()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            if col == 0 then return false end
            local line = vim.api.nvim_get_current_line()
            return line:sub(col, col):match("%s") == nil
        end

        require("blink.cmp").setup({
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = "none",
                ["<C-y>"] = {"select_and_accept"},
                ["<Tab>"] = {
                    function(cmp)
                        if has_words_before() then
                            if require("blink.cmp").is_visible() then
                                require("blink.cmp").show()
                            end
                            return cmp.insert_next()
                        end
                    end
                },
                ["<S-Tab>"] = {"insert_prev"}
            },
            completion = {
                documentation = {auto_show = true, auto_show_delay_ms = 500},
                menu = {
                    auto_show = false,
                    draw = {
                        columns = {{"kind_icon"}, {"label", gap = 1}},
                        components = {
                            label = {
                                text = function(ctx)
                                    return
                                        require("colorful-menu").blink_components_text(
                                            ctx)
                                end,
                                highlight = function(ctx)
                                    return
                                        require("colorful-menu").blink_components_highlight(
                                            ctx)
                                end
                            }
                        }
                    },
                    direction_priority = function()
                        local ctx = require("blink.cmp").get_context()
                        local item = require("blink.cmp").get_selected_item()
                        if ctx == nil or item == nil then
                            return {"s", "n"}
                        end

                        local item_text =
                            item.textEdit ~= nil and item.textEdit.newText or
                                item.insertText or item.label
                        local is_multi_line = item_text:find("\n") ~= nil
                        if is_multi_line or vim.g.blink_cmp_upwards_ctx_id ==
                            ctx.id then
                            vim.g.blink_cmp_upwards_ctx_id = ctx.id
                            return {"n", "s"}
                        end
                        return {"s", "n"}
                    end
                },
                list = {selection = {preselect = false, auto_insert = true}},
                ghost_text = {enabled = true, show_without_selection = true}
            },
            signature = {enabled = true},
            fuzzy = {implementation = "prefer_rust_with_warning"},
            sources = {
                default = {"lazydev", "lsp", "path", "snippets", "buffer"},
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100
                    },
                    path = {
                        opts = {get_cwd = function(_)
                            return vim.fn.getcwd
                        end}
                    }
                }
            }
        })
    end
}
