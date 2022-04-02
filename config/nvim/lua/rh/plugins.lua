return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use { 'ellisonleao/gruvbox.nvim' }
  use {'sainnhe/gruvbox-material'}
  use {'marko-cerovac/material.nvim'}
  use {'olimorris/onedarkpro.nvim'}

  -- File Explorer
  use { 'kyazdani42/nvim-tree.lua' }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Plenary
  use 'nvim-lua/plenary.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
    }
  }

  -- Statusline
  use { 'nvim-lualine/lualine.nvim' }

  -- Tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { 'p00f/nvim-ts-rainbow' }
  }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Show indent symbols
  use "lukas-reineke/indent-blankline.nvim"

  -- Git
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'lewis6991/gitsigns.nvim'
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
end)
