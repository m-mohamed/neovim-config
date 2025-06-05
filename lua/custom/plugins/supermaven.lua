return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      -- Setup Supermaven with inline completions enabled
      require('supermaven-nvim').setup {
        disable_inline_completion = false, -- Enable inline completion
        keymaps = {
          accept_suggestion = "<Tab>",    -- Accept suggestion with Tab
          clear_suggestion = "<C-]>",     -- Clear suggestion with Ctrl+]
          accept_word = "<C-j>",          -- Accept word with Ctrl+j
        },
        color = {
          suggestion_color = "#6CC644",   -- Green color for suggestion text
        },
      }
      
      -- Register commands to easily toggle between modes
      vim.api.nvim_create_user_command('SupermavenToggleInline', function()
        local config = require('supermaven-nvim').config
        config.disable_inline_completion = not config.disable_inline_completion
        require('supermaven-nvim').restart()
        print("Supermaven inline completion " .. 
              (config.disable_inline_completion and "disabled" or "enabled"))
      end, {})
    end,
  },
}
