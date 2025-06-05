return {
  'letieu/wezterm-move.nvim',
  keys = { -- Lazy loading, don't need call setup() function
    -- Move between Wezterm panes with Ctrl+hjkl
    {
      '<C-h>',
      function()
        require('wezterm-move').move 'h'
      end,
      desc = "Move to left pane",
    },
    {
      '<C-j>',
      function()
        require('wezterm-move').move 'j'
      end,
      desc = "Move to bottom pane",
    },
    {
      '<C-k>',
      function()
        require('wezterm-move').move 'k'
      end,
      desc = "Move to top pane",
    },
    {
      '<C-l>',
      function()
        require('wezterm-move').move 'l'
      end,
      desc = "Move to right pane",
    },
  },
}