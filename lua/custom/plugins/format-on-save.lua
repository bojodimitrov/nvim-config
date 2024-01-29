return {
  "elentok/format-on-save.nvim",

  config = function()
    local formatters = require("format-on-save.formatters")
    require("format-on-save").setup {
      exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
      },

      fallback_formatter = {
        formatters.remove_trailing_newlines,
        formatters.remove_trailing_whitespace
      },

      formatter_by_ft = {
        css = formatters.lsp,
        html = formatters.prettierd,
        javascript = formatters.lsp,
        json = formatters.lsp,
        lua = formatters.lsp,
        markdown = formatters.prettierd,
        python = formatters.black,
        rust = formatters.lsp,
        sh = formatters.shfmt,
        typescript = formatters.prettierd,
        typescriptreact = formatters.prettierd,
        yaml = formatters.lsp,
      },
    }
  end
}
