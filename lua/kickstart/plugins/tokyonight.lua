return {
  {
    -- Change to a different colorscheme by editing this section:
    -- Enter the appropriate colorscheme package name here and ensure it exists in your plugins.
    'folke/tokyonight.nvim',
    priority = 1000, -- Loads this colorscheme before any other plugins to ensure it takes effect.

    -- Options for configuring Tokyo Night specific features.
    opts = {
      style = 'night', -- Specifies the 'night' style, variable options typically include 'day', 'night', etc.
      transparent = true, -- Enable transparency for the background.
      styles = {
        sidebars = 'transparent', -- Make sidebar windows transparent (e.g., NvimTree, terminal, etc.).
        floats = 'transparent', -- Make floating windows transparent.
      },
    },

    -- Configuration function to apply settings correctly including transparency related settings.
    config = function(_, opts)
      local tokyonight = require 'tokyonight'
      tokyonight.setup(opts) -- Setup tokyonight with the specified options .
      tokyonight.load() -- Load the theme effectively applying the set options.

      -- Load the colorscheme explicitly to apply your setup effectively.
      vim.cmd.colorscheme 'tokyonight-night'

      -- Custom highlight modifications can be made post-theme load:
      vim.cmd.hi 'Comment gui=none' -- This makes comments use default font styling without any added effects.
    end,
  },
}
