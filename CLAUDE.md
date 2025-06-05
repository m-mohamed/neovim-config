# Neovim Configuration Guidelines

## Commands
- `:checkhealth` - Verify plugin health status
- `:Mason` - Manage LSP servers and tools
- `:ConformInfo` - Show current formatter configuration
- Format current buffer: `<leader>f`
- `:StartupTime` - Check Neovim startup performance

## Code Style
- Indent: 2 spaces (ts=2 sts=2 sw=2 et)
- Line length: Keep reasonably short
- Lua style: Format with stylua
- Python style: Format with isort+black
- JavaScript/TypeScript: Format with prettierd/prettier

## Core Keymappings

### Navigation & Window Control
- Window navigation: `<C-h/j/k/l>`
- Exit insert mode: `jk` (faster than Esc)
- Clear search highlight: `<Esc>` in normal mode
- Diagnostics quickfix: `<leader>q`
- Quickfix navigation: `]q`, `[q`
- Buffer navigation: `]b`, `[b`

### Search (Telescope)
- Files: `<leader>sf`
- Grep: `<leader>sg`
- Buffers: `<leader><leader>`
- Diagnostics: `<leader>sd`
- Resume last search: `<leader>sr`
- Recent files: `<leader>s.`
- Fuzzy find in buffer: `<leader>/`
- Help tags: `<leader>sh`
- Git files: `<leader>gf`
- Git status: `<leader>gs`

### LSP Features
- Go to definition: `gd`
- Go to declaration: `gD`
- References: `gr`
- Hover docs: `K`
- Code actions: `<leader>ca`
- Rename: `<leader>rn`
- Signature help: `<C-k>` (in insert mode)
- Format buffer: `<leader>f`
- Workspace diagnostics: `<leader>D`
- Buffer diagnostics: `<leader>d`
- Type definition: `<leader>gt`
- Implementation: `<leader>gi`

## AI Assistant Tools

### Supermaven (AI Code Completion)
- Inline ghost text completion:
  - Accept suggestion: `<Tab>`
  - Clear suggestion: `<C-]>`
  - Accept word: `<C-j>`
- Commands:
  - `:SupermavenToggleInline` - Toggle inline completions
  - `:SupermavenStatus` - Check connection status
- Features:
  - Powered by AI models
  - Inline ghost text
  - Customizable color (green by default)

### Avante (Conversational AI)
- Keymaps:
  - Open chat: `<leader>ac`
  - Start new chat: `<leader>an`
- Commands:
  - `:AvanteChat` - Open new/existing chat
  - `:AvanteClose` - Close current chat
  - `:AvanteToggleSplit` - Toggle window layout
- Features:
  - GPT-4o integration
  - MCPHub tool access
  - Image and code embedding
  - Markdown rendering

### MCPHub (AI Agent Hub)
- Keymaps:
  - Open hub: `<leader>mh`
- Commands:
  - `:MCPHub` - Open interface
  - `:MCPHubServers` - Manage connections
- Features:
  - Multi-agent infrastructure
  - Express API on port 37373
  - Tool extensions for Avante
  - Server auto-toggle
  - Shutdown delay: 10 minutes
  - Request timeout: 2 minutes

### Blink Completion (upgraded from nvim-cmp)
- Core keymaps:
  - Accept: `<C-y>`
  - Navigate: `<C-n>/<C-p>`
  - Show menu: `<C-Space>`
  - Close menu: `<C-e>`
  - Doc scroll: `<C-b>/<C-f>`
  - Toggle docs: `<C-d>`
  - Signature help: `<C-k>`
  - Expand snippet: `<C-l>/<C-h>`
- Features:
  - Fast fuzzy matching
  - LSP, path, snippets integration
  - Auto-brackets
  - Optimized for non-blocking performance
  - Supermaven integration

## Development Tools

### TypeScript Tools
- Enhanced TypeScript development
- Performance optimized vs standard LSP
- Settings:
  - Separate diagnostic server
  - Publishes diagnostics on insert leave
  - Code lens for implementations only

### LeetCode
- Keymaps:
  - Open console: `<leader>lc`
  - View problem list: `<leader>ll`
- Features:
  - In-editor problem solving
  - Python support with pre-imported modules:
    - typing (List, Optional)
    - collections
    - heapq
    - math

### Oil File Explorer
- Keymaps:
  - Open parent directory: `-`
  - Open in float window: `<leader>-`
- Within Oil:
  - Enter to open file
  - `<C-v>` to open in vertical split
  - `<C-s>` to open in horizontal split
  - `<C-p>` to preview
  - `q` to close
  - `g.` to toggle hidden files
- Features:
  - Show hidden files by default
  - Natural ordering
  - Floating window with rounded borders

### Cellular Automaton (Visual Effects)
- Keymaps:
  - Animation selector: `<leader>ca`
  - Make it rain: `<leader>cr`
  - Game of Life: `<leader>cl`
  - Spiral animation: `<leader>cs`
- Features:
  - Fun visual effects for code
  - Custom spiral animation
  - Interactive animation selector

### Wezterm Integration
- Keymaps:
  - Move to left pane: `<C-h>`
  - Move to bottom pane: `<C-j>`
  - Move to top pane: `<C-k>`
  - Move to right pane: `<C-l>`
- Features:
  - Seamless navigation between Neovim and Wezterm panes
  - Respects terminal boundaries

## Knowledge Management

### Obsidian Integration
- Keymaps:
  - Follow link: `<leader>of`
  - Toggle checkbox: `<leader>od`
  - Open in Obsidian app: `<leader>oo`
  - Create new note: `<leader>on`
  - Search notes: `<leader>os`
  - Quick switch: `<leader>oq`
  - Today's note: `<leader>oty`
  - Yesterday's note: `<leader>oys`
  - Tomorrow's note: `<leader>otm`
- Features:
  - Workspace: ~/obsidian/Slipbox
  - Daily notes in "5. Dailies"
  - Custom frontmatter
  - Template support
  - Complete daily note navigation (yesterday/today/tomorrow)

### Pomo Timer
- Keymaps:
  - Start Pomodoro session: `<leader>ps`
  - Start 25m work timer: `<leader>pw`
  - Start 5m break timer: `<leader>pb`
  - Start 15m long break: `<leader>pl`
  - Stop timer: `<leader>pt`
  - Pause timer: `<leader>pp`
  - Resume timer: `<leader>pr`
- Features:
  - Pomodoro technique integration
  - Predefined sessions
  - Multiple timers with naming
  - Notification system

### Noice UI Enhancement
- Features:
  - Enhanced UI for messages, cmdline
  - Non-intrusive notifications
  - Filtered notification routes (hides "not an image" notifications)
  - Cleaner command line experience
  - Message history with `:Noice`

## Plugin Architecture
- Core modules in `/lua/kickstart/plugins/`
- Custom modules in `/lua/custom/plugins/`
- Lazy-loaded for optimal startup time
- Follows modular pattern for organization

## Language Servers
- Lua: lua_ls (configured with callSnippet='Replace')
- Python: pyright
- TypeScript/JavaScript: typescript-tools
- Additional servers can be added in lspconfig.lua
- Managed via Mason: `:Mason`

## Maintenance

### Upstream Sync Process
1. `git fetch upstream`
2. `git merge upstream/master`
3. Resolve conflicts preserving customizations

### Health Checks
- Run `:checkhealth` to verify plugin status
- Monitor startup time with `:StartupTime`

## Further Customization

### Adding New Plugins
1. Create file in `/lua/custom/plugins/[name].lua`
2. Use lazy.nvim spec format
3. Define dependencies, config, and keymaps
4. Document in this file

### Project Structure
- `/lua/kickstart/` - Core configuration
- `/lua/custom/plugins/` - User-specific plugins
- Use modular approach for new plugins and configurations

### Error Handling
- Use vim.diagnostic for error reporting
- Add useful error messages for better debugging
- Handle edge cases appropriately