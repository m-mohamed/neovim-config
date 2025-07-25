return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  cmd = { "AvanteChat", "AvanteClose", "AvanteNew" }, -- Lazy load on commands
  keys = {
    { "<leader>ac", "<cmd>AvanteChat<cr>", desc = "Open Avante Chat" },
    { "<leader>an", "<cmd>AvanteNew<cr>", desc = "New Avante Chat" },
  },
  opts = {
    -- add any opts here
    -- for example
    provider = 'openai',
    providers = {
      openai = {
        endpoint = 'https://api.openai.com/v1',
        model = 'gpt-4o', -- your desired model (or use gpt-4o, etc.)
        timeout = 30000, -- timeout in milliseconds
        extra_request_body = {
          temperature = 0, -- adjust if needed
          max_tokens = 4096,
          -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
        },
      },
    },
    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    system_prompt = function()
      local ok, mcphub = pcall(require, 'mcphub')
      if not ok then
        return '' -- Return empty string or default prompt if mcphub is not available
      end
      local hub = mcphub.get_hub_instance()
      if not hub then
        return '' -- Return empty string or default prompt if hub instance is not available
      end
      return hub:get_active_servers_prompt()
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
      local ok, mcphub_ext = pcall(require, 'mcphub.extensions.avante')
      if not ok then
        return {}
      end
      return {
        mcphub_ext.mcp_tool(),
      }
    end,
    -- Disable tools that are provided by MCPHub's built-in Neovim server
    disabled_tools = {
      'list_files', -- Built-in file operations
      'search_files',
      'read_file',
      'create_file',
      'rename_file',
      'delete_file',
      'create_dir',
      'rename_dir',
      'delete_dir',
      'bash', -- Built-in terminal access
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'ravitemer/mcphub.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
          -- Disable notifications
          notify = {
            enabled = false,
          },
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
