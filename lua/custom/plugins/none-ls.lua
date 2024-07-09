return {
  'nvimtools/none-ls.nvim',

  config = function()
    local null_ls = require 'null-ls'
    local h = require("null-ls.helpers")
    local u = require("null-ls.utils")

    null_ls.setup {
      sources = {
        -- formatting
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with {
          filetypes = { 'html', 'json', 'js', 'ts', 'jsx', 'tsx', 'yaml', 'markdown' },
        },
        null_ls.builtins.formatting.black,

        -- diagnostics
        null_ls.builtins.diagnostics.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file { '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', 'eslint.config.js' }
          end,
        },

        -- code_actions
        null_ls.builtins.code_actions.eslint_d.with {
          condition = function(utils)
            return utils.root_has_file { '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', 'eslint.config.js' }
          end,
        },
      },
    }



    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end,
}
