return {
    'kevinhwang91/nvim-ufo',
    dependencies = {
        'kevinhwang91/promise-async'
    },
    config = function()
        vim.opt.foldenable = true
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.opt.foldtext = ""
        vim.opt.viewoptions:append("folds")
        vim.opt.fillchars = {
            foldopen = "󰜰",
            foldclose = "󰜵",
            foldsep = " ",
            fold = " ",
            eob = " ",
        }
        vim.keymap.set('n', 'zr', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zm', require('ufo').closeAllFolds)

        vim.api.nvim_create_autocmd("BufWinLeave", {
            pattern = "*",
            callback = function()
                vim.cmd("silent! mkview")
            end,
        })

        vim.api.nvim_create_autocmd("BufWinEnter", {
            pattern = "*",
            callback = function()
                vim.cmd("silent! loadview")
            end,
        })

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󱥤 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, nil })
            return newVirtText
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
        local language_servers = vim.lsp.get_clients()
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
            })
        end
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                local hasFolds = vim.fn.filereadable(
                    string.format('%s/queries/%s/folds.scm', vim.fn.stdpath('data') .. '/lazy/nvim-treesitter', filetype)
                ) == 1
                if hasFolds then
                    return { 'lsp', 'treesitter' }
                else
                    return { 'lsp', 'indent' }
                end
            end,
            fold_virt_text_handler = handler,
        })
    end
}
