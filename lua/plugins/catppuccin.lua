return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()

    require("catppuccin").setup({
      transparent_background = false,

      opts = {
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          -- which_key = true
        }
      },

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
