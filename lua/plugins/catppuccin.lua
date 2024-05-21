return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    
    require("catppuccin").setup {
      transparent_background = false,
      color_overrides = {
        mocha = {
          base = "#14122a"
        }
      }
    }
    vim.cmd.colorscheme "catppuccin-mocha"

  end
}
