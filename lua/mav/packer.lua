-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'thedenisnikulin/vim-cyberpunk'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/nvim-treesitter-context')
  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
			  'williamboman/mason.nvim',
			  run = function()
				  pcall(vim.cmd, 'MasonUpdate')
			  end,
		  },
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lua'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	  }
  }
  -- Remove the `use` here if you're using folke/lazy.nvim.
    use {
      'Exafunction/codeium.vim',
      config = function ()
        -- Change '<C-g>' here to any keycode you like.
        vim.keymap.set('i', '<C-Space>', function () return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<C-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      end
    }
    use{
        'norcalli/nvim-colorizer.lua',
        config = function()
            vim.opt.termguicolors = true
            require'colorizer'.setup({
                '*';
            }, {
                css = true;
                RRGGBBAA = true;
            })
        end
    }
    use ({"ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end,
    })
    use "stevearc/dressing.nvim"
    use({
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true
            })
        end,
    })
    use('ryanoasis/vim-devicons')
end)

