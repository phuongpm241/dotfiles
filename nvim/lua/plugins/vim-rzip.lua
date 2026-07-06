-- vim-rzip: read files stored inside .zip archives, which is how Yarn Berry's
-- Plug'n'Play (PnP) keeps dependencies. Lets LSP "go to definition" jump into
-- a dependency's source even though it lives inside a zip. Load at startup so
-- the zip BufReadCmd is registered before any such file is opened.
return {
    {
	'lbrayner/vim-rzip',
	lazy = false,
    },
}
