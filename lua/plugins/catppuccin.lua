return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    
    require("catppuccin").setup({
      transparent_background = false,
      
      color_overrides = {
        all = {
          text = "#ffffff"
        },
        mocha = {
          base = "#14122a"
        },
        frappe = {},
        macchiato = {},
        latte = {},
      },

      custom_highlights = function(colors)
        return {
          NeoTreeNormal = { bg = "#15132f" },
          NeoTreeNormalNC = { bg = "#15132f" },
        }
      end

    })

    vim.cmd.colorscheme "catppuccin-mocha"

  end
}
