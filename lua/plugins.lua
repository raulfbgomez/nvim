return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
  
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
  
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
  
    use {
        "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }
  
    use "lukas-reineke/indent-blankline.nvim"
  
    -- Themes
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    use "olimorris/onedarkpro.nvim"
  
end)