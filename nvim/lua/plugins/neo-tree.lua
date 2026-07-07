return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        cmd = 'Neotree',
        keys = {
            { '<leader>e', '<cmd>Neotree toggle left<cr>', desc = 'Toggle file explorer' },
        },
        opts = {
            close_if_last_window = true,
            window = { position = 'left', width = 32 },
            filesystem = {
                follow_current_file = { enabled = false }, -- toggle-only: no auto-reveal
                use_libuv_file_watcher = true,
                filtered_items = { visible = false, hide_dotfiles = false, hide_gitignored = false },
            },
        },
    },
}
