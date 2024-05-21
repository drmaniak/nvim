return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup {
      options = {
        -- theme = "dracula"
        theme = "palenight"
        --theme = "horizon"
        --theme = "papercolor_light"
      }

    }
  end
}
