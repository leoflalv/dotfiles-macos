local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- navigator
	use("christoomey/vim-tmux-navigator")

	-- terminal
	use("akinsho/nvim-toggleterm.lua") -- Terminal

	-- colorscheme
	use("bluz71/vim-nightfly-guicolors")
	use("Shatur/neovim-ayu")

	-- commons
	use("tpope/vim-unimpaired")
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")
	use("tpope/vim-commentary")

	-- identations
	use("lukas-reineke/indent-blankline.nvim")

	-- nvim tree
	use("nvim-tree/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")

	-- lualine
	use("nvim-lualine/lualine.nvim")

	-- finder
	use("nvim-telescope/telescope-fzy-native.nvim") -- Telescope finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { { "nvim-lua/plenary.nvim" } } }) -- fuzzy finder

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("rafamadriz/friendly-snippets") -- snippet completions

	-- managing lsp
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer

	-- lsp
	use("neovim/nvim-lspconfig") -- enable LSP
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"nvimdev/lspsaga.nvim",
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	use("dart-lang/dart-vim-plugin")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}) -- show line modifications on left hand side

	-- -- copilote
	-- use("github/copilot.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
