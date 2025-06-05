return {

  'kawre/leetcode.nvim',
  cmd = 'Leet',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',

    -- optional
    'nvim-treesitter/nvim-treesitter',
    'rcarriga/nvim-notify',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    -- configuration goes here
    lang = 'python',
  },
  -- Note that this should be within the curly braces of this table
  -- for it to be in the correct scope.
}
