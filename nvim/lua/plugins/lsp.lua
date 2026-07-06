return {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
        { 'mason-org/mason.nvim', opts = {} },
        'neovim/nvim-lspconfig',
    },
    config = function()
        -- lua_ls: don't flag the `vim` global as undefined in nvim config files
        vim.lsp.config('lua_ls', {
            settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
        })

        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'vimls', 'marksman', 'ts_ls', 'pyright', 'gopls' },
        })

        -- native autocompletion on every LSP that supports it
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client and client:supports_method('textDocument/completion') then
                    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
                end
            end,
        })
    end
}
