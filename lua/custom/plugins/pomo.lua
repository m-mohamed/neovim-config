return {
  'epwalsh/pomo.nvim',
  version = '*', -- Use the latest release
  lazy = true, -- Don't load immediately
  cmd = { 'TimerStart', 'TimerRepeat', 'TimerStop', 'TimerPause', 'TimerResume', 'TimerSession' }, -- Load when these commands are used
  keys = {
    { "<leader>ps", "<cmd>TimerSession pomodoro<cr>", desc = "Start Pomodoro session" },
    { "<leader>pw", "<cmd>TimerStart 25m Work<cr>", desc = "Start 25m work timer" },
    { "<leader>pb", "<cmd>TimerStart 5m Break<cr>", desc = "Start 5m break timer" },
    { "<leader>pl", "<cmd>TimerStart 15m Long break<cr>", desc = "Start 15m long break" },
    { "<leader>pt", "<cmd>TimerStop<cr>", desc = "Stop timer" },
    { "<leader>pp", "<cmd>TimerPause<cr>", desc = "Pause timer" },
    { "<leader>pr", "<cmd>TimerResume<cr>", desc = "Resume timer" },
  },
  dependencies = {
    'rcarriga/nvim-notify', -- Used for notifications
  },
  opts = {
    -- Update interval in milliseconds
    update_interval = 1000,
    
    -- Pomo.nvim notifier configuration
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
    
    -- Predefined timer sessions
    sessions = {
      -- Standard pomodoro session: 25-minute work + 5-minute break
      pomodoro = {
        { name = "Work", duration = "25m" },
        { name = "Short Break", duration = "5m" },
      },
      
      -- Extended pomodoro session with 4 work periods and a long break
      pomodoro_long = {
        { name = "Work 1", duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work 2", duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work 3", duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work 4", duration = "25m" },
        { name = "Long Break", duration = "15m" },
      },
      
      -- Quick session for testing
      test = {
        { name = "Test Work", duration = "10s" },
        { name = "Test Break", duration = "5s" },
      },
    },
  },
}
