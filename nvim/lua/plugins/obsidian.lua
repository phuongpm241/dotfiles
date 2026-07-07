return {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = 'michelle_vault',
                path = '~/obsidian_vault',
            },
        },

        -- New notes go in the vault root
        new_notes_location = 'notes_subdir',
        notes_subdir = '',

        templates = {
            folder = 'templates',
            date_format = '%Y-%m-%d',
            time_format = '%H:%M',
        },

        daily_notes = {
            folder = 'Areas/SecondBrain',
            date_format = '%Y-%m-%d',
        },

        -- Use the Telescope you already have installed
        picker = {
            name = 'telescope.nvim',
        },
        -- Completion is served by the built-in obsidian-ls LSP, which the
        -- LspAttach autocmd in lsp.lua wires into native completion.
    }
}
