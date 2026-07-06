local parsers = { 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline', 'typescript', 'javascript', 'python', 'go' }
local filetypes = { 'lua', 'vim', 'help', 'markdown', 'typescript', 'javascript', 'python', 'go' }

return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install(parsers)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,
            callback = function() vim.treesitter.start() end,
        })
    end
}
