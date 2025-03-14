vim.g.mapleader = " "

local vimplugPath = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"

if not vim.loop.fs_stat(vimplugPath) then
	local vimplugRepo = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	vim.fn.system({
		"curl",
		"-fLo",
		vimplugPath,
		"--create-dirs",
		vimplugRepo,
	})

	vim.cmd("autocmd VimEnter * PlugInstall")
end

local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin") -- Plugins

Plug("catppuccin/nvim", { ["as"] = "catppuccin" })
Plug("uZer/pywal16.nvim", { [ "as" ] = "pywal16" })
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("windwp/nvim-autopairs")
Plug("numToStr/FTerm.nvim")
Plug("numToStr/Comment.nvim")
Plug("nvim-treesitter/nvim-treesitter")
Plug("nvim-lualine/lualine.nvim")
Plug("ThePrimeagen/harpoon", { branch = "harpoon2" })
Plug("tpope/vim-fugitive")
-- LSP Completion 
Plug("L3MON4D3/LuaSnip", { tag = "v2.*" })
Plug("saadparwaiz1/cmp_luasnip")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/nvim-cmp", { event = "InsertEnter" })
-- LSP
Plug("folke/lazydev.nvim", { ft = "lua" })
Plug("neovim/nvim-lspconfig")
Plug ("williamboman/mason.nvim")
Plug ("williamboman/mason-lspconfig.nvim")

vim.call("plug#end") -- end Plugins

require("options")
require("keymaps")
require("colortheme")

require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.colorscheme")
require("plugins.telescope")
require("plugins.fterm")
require("plugins.lualine")
require("plugins.harpoon")
require("plugins.lsp")
require("plugins.completion")
