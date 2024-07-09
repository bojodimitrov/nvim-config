return {
  "rebelot/kanagawa.nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  --Optional; default configuration will be used if setup isn't called.
  config = function()
    require("kanagawa").setup({
      keywordStyle = { italic = false, bold = false },
      commentStyle = { italic = false },
      undercurl = false,
      colors = {
        palette = {
          sakuraPink = "#f7b5ca",
          crystalBlue = "#f5d15b",
          oniViolet = "#ec65a2",
          oniViolet2 = "#dad5f7",   -- parameters
          surimiOrange = "#f0eac7", -- constants
          springGreen = "#ffb224",  -- Strings
          waveAqua2 = "#9bd455",    -- Used in imports
          springBlue = "#9bd455",   -- Components and classes
          sumiInk3 = "#151517",
          boatYellow2 = "#c0caf5",  -- Interfaces and operators
          fujiGray = "#717C7C",     -- Comments
          waveRed = "#8a9cff"
        },
      },
      background = {
        dark = "wave"
      },
      overrides = function(colors)
        return {
          ["@lsp.typemod.function.readonly"] = { fg = colors.theme.syn.fun, bold = false },
          ["@lsp.type.enum"] = { fg = colors.theme.syn.special2, bold = false },
          ["@lsp.type.interface"] = { fg = colors.theme.syn.operator, bold = false },
        }
      end,
    })
    vim.cmd.colorscheme("kanagawa")
  end,
}
