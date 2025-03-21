-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('norcalli/nvim-colorizer.lua')
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},


		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }

use {
  "echasnovski/mini.animate",
  config = function()
    require("mini.animate").setup({
      cursor = {
        enable = true,  -- Enable cursor animation
        timing = function(_, n) return 50 end, -- Adjust speed (lower is faster)
      },
      scroll = {
        enable = true, -- Enable smooth scrolling
      },
      resize = {
        enable = false, -- Optional: If you want window resize animation
      },
      open = {
        enable = false, -- Optional: If you want opening animation
      },
      close = {
        enable = false, -- Optional: If you want closing animation
      },
    })
  end
}

use {
    'vimwiki/vimwiki',
    config = function()
        vim.g.vimwiki_list = {
            {
                path = '~/Documents/journal',
                syntax = 'markdown',
                ext = '.md'
            }
        }
        vim.g.vimwiki_auto_diary_index = 1  -- Enable automatic diary index
    end
}

use { "lervag/vimtex" } -- Main LaTeX plugin

  end)
