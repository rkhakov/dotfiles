local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use "EdenEast/nightfox.nvim"

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
  use "jose-elias-alvarez/null-ls.nvim"

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

  -- Git
  use 'TimUntersberger/neogit'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)