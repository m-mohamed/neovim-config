return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Loads this colorscheme before any other plugins to ensure it takes effect.
    config = function()
      -- Combine both configurations
      require('tokyonight').setup {
        style = 'night',
        transparent = true, -- Enable transparency for the background
        styles = {
          sidebars = 'transparent', -- Make sidebar windows transparent
          floats = 'transparent', -- Make floating windows transparent
          comments = { italic = false }, -- Disable italics in comments (from upstream)
        },
      }

      -- Load the colorscheme
      vim.cmd.colorscheme 'tokyonight-night'
      
      -- Custom highlight modifications
      vim.cmd.hi 'Comment gui=none' -- This makes comments use default font styling
    end,
  },
}
