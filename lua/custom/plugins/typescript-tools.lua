return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  opts = {
    -- Improve performance with separate diagnostic server
    settings = {
      -- Spawn a dedicated tsserver for diagnostics
      separate_diagnostic_server = true,
      -- Define when diagnostics are published
      publish_diagnostic_on = "insert_leave",
      -- Reduce noise from CodeLens
      code_lens = "implementations_only",
      -- Don't show CodeLens for members (properties, fields)
      disable_member_code_lens = true,
      -- Configure tsserver to complete function calls with ()
      complete_function_calls = true,
    },
    -- Define features available as code actions
    expose_as_code_action = {
      "fix_all",
      "add_missing_imports", 
      "remove_unused",
      "organize_imports",
    },
    -- Configure tsserver formatting options
    tsserver_format_options = {
      insertSpaceAfterCommaDelimiter = true,
      insertSpaceAfterConstructor = false,
      insertSpaceAfterSemicolonInForStatements = true,
      insertSpaceBeforeAndAfterBinaryOperators = true,
      insertSpaceAfterKeywordsInControlFlowStatements = true,
      insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
      insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
      insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
      insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
      insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
      insertSpaceBeforeFunctionParenthesis = false,
      placeOpenBraceOnNewLineForFunctions = false,
      placeOpenBraceOnNewLineForControlBlocks = false,
      semicolons = "insert",
      indentSize = 2,
    },
  },
}
