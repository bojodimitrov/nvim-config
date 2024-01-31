return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,

  config = function()
    require('catppuccin').setup {
      integrations = {
        harpoon = true,
      },
    }

    vim.cmd 'colorscheme catppuccin-macchiato'
  end,
}
