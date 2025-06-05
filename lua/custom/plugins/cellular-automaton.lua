return {
  'Eandrju/cellular-automaton.nvim',
  -- Plugin will be loaded on demand when commands are used
  cmd = "CellularAutomaton",
  config = function()
    local automaton = require("cellular-automaton")
    
    -- Register a custom animation (example: spiral pattern)
    local spiral_config = {
      fps = 30,
      name = 'spiral',
      init = function(grid)
        -- Initialize any custom state if needed
      end,
      update = function(grid)
        -- Implement a spiral-like pattern
        for i = 1, #grid do
          local prev = grid[i][#(grid[i])]
          for j = 1, #(grid[i]) do
            if i % 2 == 0 then
              -- Even rows shift right
              grid[i][j], prev = prev, grid[i][j]
            else
              -- Odd rows shift left
              local pos = #(grid[i]) - j + 1
              grid[i][pos], grid[i][pos == #(grid[i]) and 1 or pos + 1] = 
                grid[i][pos == #(grid[i]) and 1 or pos + 1], grid[i][pos]
            end
          end
        end
        return true -- Continue animation
      end
    }
    automaton.register_animation(spiral_config)
    
    -- Set up keymaps for easy access
    vim.keymap.set("n", "<leader>ca", function()
      vim.ui.select(
        {"make_it_rain", "game_of_life", "spiral"}, 
        {prompt = "Choose animation:"},
        function(choice)
          if choice then
            vim.cmd("CellularAutomaton " .. choice)
          end
        end
      )
    end, {desc = "Run Cellular Automaton"})
    
    -- Direct keymaps for specific animations
    vim.keymap.set("n", "<leader>cr", "<cmd>CellularAutomaton make_it_rain<CR>", 
      {desc = "Cellular Automaton: Make it rain"})
    vim.keymap.set("n", "<leader>cl", "<cmd>CellularAutomaton game_of_life<CR>", 
      {desc = "Cellular Automaton: Game of Life"})
    vim.keymap.set("n", "<leader>cs", "<cmd>CellularAutomaton spiral<CR>", 
      {desc = "Cellular Automaton: Spiral"})
  end,
}