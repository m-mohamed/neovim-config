return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    -- Easy access to Oil
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
    { '<leader>-', function() require('oil').toggle_float() end, desc = 'Float Oil file explorer' },
  },
  opts = {
    -- Id is automatically added to columns
    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    -- Buffer-local options to use for oil buffers
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },
    -- Window-local options to use for oil buffers
    win_options = {
      wrap = false,
      signcolumn = "no",
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },
    -- Default keymaps
    -- Use '<C-s>' for horizontal split
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = false, -- Don't override window navigation
      ["<C-h>"] = false, -- Don't override window navigation
      ["q"] = "actions.close",
      ["<Esc>"] = "actions.close",
      ["gx"] = "actions.open_external",
      ["gy"] = "actions.copy_entry_path",
      ["gr"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["g."] = "actions.toggle_hidden",
    },
    -- Set to false to disable default keymaps
    use_default_keymaps = true,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      -- Sort files using "natural" order (smart sorting for numbers)
      natural_order = true,
      sort = {
        -- Sort directories at the top
        { "type", "asc" },
        -- Then sort by name
        { "name", "asc" },
      },
    },
    -- Configuration for floating window
    float = {
      -- Maximum width of floating window
      max_width = 80,
      -- Maximum height of floating window
      max_height = 30,
      -- Border style of floating window
      border = "rounded",
      -- When to make floating window fullscreen
      win_options = {
        winblend = 10, -- Slight transparency
      },
    },
    -- Restore window options to previous values when closing an oil buffer
    restore_win_options = true,
    -- Skip the confirmation popup for simple operations
    skip_confirm_for_simple_edits = true,
    -- Deleted files will be removed with the trash_command instead of permanently
    delete_to_trash = true,
    -- Change preview window border style
    preview_border = "rounded",
    -- Apply icon highlights to files based on their file type
    file_icon_highlight = true,
  },
}
