# Neovim Configuration Guidelines

## Commands
- `:checkhealth` - Verify plugin health status
- `:Mason` - Manage LSP servers and tools
- `:ConformInfo` - Show current formatter configuration
- Format current buffer: `<leader>f`

## Code Style
- Indent: 2 spaces (ts=2 sts=2 sw=2 et)
- Line length: Keep reasonably short
- Lua style: Format with stylua
- Python style: Format with isort+black
- JavaScript/TypeScript: Format with prettierd/prettier

## Language Servers
- Lua: lua_ls (configured with callSnippet='Replace')
- Python: pyright
- Additional servers can be added in lspconfig.lua

## Naming Conventions
- Use snake_case for variables and functions
- Use descriptive names that clearly indicate purpose
- Follow Lua idioms: local variables, avoid global scope

## Error Handling
- Use vim.diagnostic for error reporting
- Add useful error messages for better debugging
- Handle edge cases appropriately

## Project Structure
- `/lua/kickstart/` - Core configuration
- `/lua/custom/plugins/` - User-specific plugins
- Use modular approach for new plugins and configurations