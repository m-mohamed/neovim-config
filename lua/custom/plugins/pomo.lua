return {
  'epwalsh/pomo.nvim',
  version = '*', -- Use the latest release
  lazy = true, -- Don't load immediately
  cmd = { 'TimerStart', 'TimerRepeat' }, -- Load when these commands are used
  dependencies = {
    'rcarriga/nvim-notify', -- Used for notifications
  },
  opts = {
    -- Pomo.nvim configuration options
    notifiers = {
      {
        name = 'Default',
        opts = {
          sticky = true,
          title_icon = '󱎫',
          text_icon = '󰄉',
        },
      },
      {
        name = 'System',
        opts = { sound = true }, -- Use system notifications with sound
      },
    },
  },
}
