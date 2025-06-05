return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = 'MCPHub', -- lazy load by default
  keys = {
    { "<leader>mh", "<cmd>MCPHub<cr>", desc = "Open MCP Hub" },
  },
  build = 'npm install -g mcp-hub@latest', -- Installs globally
  config = function()
    require('mcphub').setup {
      -- Server configuration
      port = 37373, -- Port for MCP Hub Express API
      config = vim.fn.expand '~/.config/mcphub/servers.json', -- Config file path
      shutdown_delay = 10, -- Shutdown after 10 minutes of inactivity
      mcp_request_timeout = 120, -- Timeout for MCP requests (seconds)
      auto_toggle_mcp_servers = true, -- Auto start/stop MCP servers when needed
      
      native_servers = {}, -- add your native servers here
      
      -- Extension configurations
      auto_approve = false, -- Require manual approval for extension actions
      extensions = {
        avante = {
          -- Avante-specific configuration (using defaults)
        },
        codecompanion = {
          show_result_in_chat = true, -- Show tool results in chat
          make_vars = true, -- Create chat variables from resources
          make_slash_commands = true, -- make /slash_commands from MCP server prompts
        },
      },

      -- UI configuration
      ui = {
        window = {
          width = 0.8, -- Window width (0-1 ratio)
          height = 0.8, -- Window height (0-1 ratio)
          border = 'rounded', -- Window border style
          relative = 'editor', -- Window positioning
          zindex = 50, -- Window stack order
        },
      },

      -- Event callbacks
      on_ready = function(hub)
        vim.notify("MCP Hub ready", vim.log.levels.INFO, { title = "MCP Hub" })
      end,
      
      on_error = function(err)
        vim.notify("MCP Hub error: " .. tostring(err), vim.log.levels.ERROR, { title = "MCP Hub" })
      end,

      -- Logging configuration
      log = {
        level = vim.log.levels.WARN, -- Minimum log level
        to_file = false, -- Enable file logging
        file_path = nil, -- Custom log file path
        prefix = 'MCPHub', -- Log message prefix
      },
    }
  end,
}