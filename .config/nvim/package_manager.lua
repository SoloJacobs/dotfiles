local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- install package manager, if not present
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/which-key.nvim",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
			},
		},
	},
	"ryanoasis/vim-devicons",
	"nanotech/jellybeans.vim",
	"neovim/nvim-lspconfig",
	"mhinz/vim-grepper",
	"ntpeters/vim-better-whitespace",
	"tpope/vim-fugitive",
	"lervag/vimtex",
	"tpope/vim-unimpaired",
	"dyng/ctrlsf.vim",
	"ctrlpvim/ctrlp.vim",
})
