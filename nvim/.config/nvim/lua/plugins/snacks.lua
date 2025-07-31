return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = "folke/flash.nvim",
    config = function()
        require("snacks").setup({
            quickfile = {
                enabled = true,
           },
            dashboard = {
                enabled = true,  sections = {
                    { section = "header" },
                    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    { section = "startup" },
                  },
            },
            picker = {
                enabled = true,
                win = {
                    input = {
                        keys = {
                          ["<a-s>"] = { "flash", mode = { "n", "i" } },
                            ["s"] = { "flash" },  
                        }
                    }
                }
            },
            explorer = {
                enabled = true,
                auto_close = true
            },
            scroll = {
                enabled = true,
                animate = {
                    duration = { step = 15, total = 140 },
                    easine = "linear",
                  },
            },
            actions = {
               flash = function(picker)
              require("flash").jump({
                pattern = "^",
                label = { after = { 0, 0 } },
                search = {
                  mode = "search",
                  exclude = {
                    function(win)
                      return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                    end,
                  },
                },
                action = function(match)
                  local idx = picker.list:row2idx(match.pos[1])
                  picker.list:_move(idx, true, true)
                end,
              })
            end, 
            }


        })
        
        -- Top Pickers & Explorer
        vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { noremap = true, silent = true, desc = "Smart Find Files" })
        vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { noremap = true, silent = true, desc = "Buffers" })
        vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { noremap = true, silent = true, desc = "Grep" })
        vim.keymap.set("n", "<leader>e", function() Snacks.picker.explorer(require("snacks").config.explorer) end, { noremap = true, silent = true, desc = "File Explorer" })

        -- Find
        vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { noremap = true, silent = true, desc = "Find Config File" })
        vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { noremap = true, silent = true, desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { noremap = true, silent = true, desc = "Find Git Files" })
        vim.keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end, { noremap = true, silent = true, desc = "Projects" })
        vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { noremap = true, silent = true, desc = "Recent" })

        -- Git
        vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { noremap = true, silent = true, desc = "Git Branches" })
        vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { noremap = true, silent = true, desc = "Git Log" })
        vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { noremap = true, silent = true, desc = "Git Log Line" })
        vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { noremap = true, silent = true, desc = "Git Status" })
        vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end, { noremap = true, silent = true, desc = "Git Stash" })
        vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { noremap = true, silent = true, desc = "Git Diff (Hunks)" })
        vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { noremap = true, silent = true, desc = "Git Log File" })

        -- Grep
        vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { noremap = true, silent = true, desc = "Buffer Lines" })
        vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { noremap = true, silent = true, desc = "Grep Open Buffers" })
        vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { noremap = true, silent = true, desc = "Visual selection or word" })

        -- Search
        vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end, { noremap = true, silent = true, desc = "Autocmds" })
        vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { noremap = true, silent = true, desc = "Commands" })
        vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { noremap = true, silent = true, desc = "Help Pages" })
        vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end, { noremap = true, silent = true, desc = "Highlights" })
        vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end, { noremap = true, silent = true, desc = "Icons" })
        vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end, { noremap = true, silent = true, desc = "Jumps" })
        vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { noremap = true, silent = true, desc = "Keymaps" })
        vim.keymap.set("n", "<leader>sm", function() Snacks.picker.man() end, { noremap = true, silent = true, desc = "Man Pages" })
        vim.keymap.set("n", "<leader>sR", function() Snacks.picker.resume() end, { noremap = true, silent = true, desc = "Resume" })
        vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { noremap = true, silent = true, desc = "Undo History" })

        -- LSP
        vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { noremap = true, silent = true, desc = "Goto Definition" })
        vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { noremap = true, silent = true, desc = "Goto Declaration" })
        vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { noremap = true, silent = true, desc = "References" })
        vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { noremap = true, silent = true, desc = "Goto Implementation" })
        vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { noremap = true, silent = true, desc = "Goto T[y]pe Definition" })
        vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { noremap = true, silent = true, desc = "LSP Symbols" })
        vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { noremap = true, silent = true, desc = "LSP Workspace Symbols" })



    end 
}
