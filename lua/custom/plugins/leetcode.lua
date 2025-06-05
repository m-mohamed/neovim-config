return {
  'kawre/leetcode.nvim',
  cmd = 'Leet',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',
    'nvim-treesitter/nvim-treesitter',
    'rcarriga/nvim-notify',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { "<leader>lc", "<cmd>Leet console<cr>", desc = "LeetCode Console" },
    { "<leader>ll", "<cmd>Leet list<cr>", desc = "LeetCode Problem List" },
    { "<leader>ld", "<cmd>Leet desc<cr>", desc = "LeetCode Problem Description" },
    { "<leader>lr", "<cmd>Leet run<cr>", desc = "LeetCode Run Code" },
    { "<leader>ls", "<cmd>Leet submit<cr>", desc = "LeetCode Submit Solution" },
  },
  opts = {
    -- Choose your preferred language
    lang = 'python',

    -- Configure LeetCode
    cn = {
      enabled = false, -- Use LeetCode China
      translator = false, -- Use translator
      translate_problems = false, -- Translate problem descriptions
    },

    -- Directory settings
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode", -- Store solutions here
      cache = vim.fn.stdpath("cache") .. "/leetcode", -- Store session and cache here
    },

    -- Use Telescope as the question picker
    picker = {
      name = "telescope", -- Use Telescope for problem selection
      theme = "dropdown", -- Use a more compact theme
    },

    -- Enable logging notifications
    logging = true,

    -- Inject code based on language
    injector = {
      ["python"] = {
        before = { -- Code to inject before your solution
          "from typing import List, Optional",
          "import collections",
          "import heapq",
          "import math",
        },
      },
      ["javascript"] = {
        before = {
          "// Helper code (if needed)",
        },
      },
    },

    -- Enable hooks (executed on events)
    hooks = {
      -- When entering LeetCode mode
      enter = function()
        vim.opt_local.wrap = true
        vim.opt_local.scrolloff = 5
      end,
    },
  },
}
