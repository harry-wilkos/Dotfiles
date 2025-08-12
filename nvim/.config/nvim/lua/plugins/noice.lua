return {
  "folke/noice.nvim",
  event = "VeryLazy",
  priority = 1000,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    vim.keymap.set('n', '<leader>nl', '<cmd>Noice last<CR>', {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>nh', '<cmd>Noice picker<cr>', {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>na', '<cmd>Noice all<cr>', {noremap = true, silent = true})
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },

    })

    require("notify").setup({
		timeout = 750,
		render = "compact"
		})
  end,
}
