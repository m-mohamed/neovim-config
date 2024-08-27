return {
  'epwalsh/obsidian.nvim',
  version = '*', -- Use the latest release
  lazy = true, -- Don't load immediately
  ft = 'markdown', -- Load for markdown files
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'epwalsh/pomo.nvim',
  },
  keys = {
    -- Define keymaps specific to Obsidian
    {
      '<leader>of',
      function()
        return require('obsidian').util.gf_passthrough()
      end,
      expr = true,
      desc = 'Obsidian follow link',
    },
    {
      '<leader>od',
      function()
        return require('obsidian').util.toggle_checkbox()
      end,
      desc = 'Obsidian toggle checkbox',
    },
  },
  opts = {
    -- Obsidian.nvim configuration options
    ui = {
      enable = false, -- Disable the UI as advised by the health check
    },
    workspaces = {
      {
        name = 'Slipbox',
        path = '~/obsidian/Slipbox',
      },
    },
    completion = {
      nvim_cmp = true, -- Use nvim-cmp for completion
      min_chars = 2,
    },
    new_notes_location = 'current_dir',
    prepend_note_id = true,
    daily_notes = {
      folder = '5. Dailies',
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      default_tags = { 'daily-notes' },
    },
    -- Function to generate frontmatter for new notes
    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = '', project = '' }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
    templates = {
      subdir = 'Templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
      tags = '',
    },
  },
}
