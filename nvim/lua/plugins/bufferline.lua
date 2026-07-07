return {
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = 'VeryLazy',
        opts = {
            options = {
                mode = 'buffers',
                diagnostics = 'nvim_lsp',
                offsets = {
                    { filetype = 'neo-tree', text = 'File Explorer', highlight = 'Directory', separator = true },
                },
                separator_style = 'thin',
                show_buffer_close_icons = true,
                show_close_icon = false,
            },
        },
        config = function(_, opts)
            require('bufferline').setup(opts)
            vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next tab' })
            vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev tab' })
            vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Close buffer/tab' })
        end,
    },
}
