return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        disable_inline_completion = true, -- Disable inline completion to avoid conflicts with nvim-cmp
        disable_keymaps = true, -- Disable default keymaps
        -- You can add any other Supermaven-specific settings here
      }
    end,
  },
}
