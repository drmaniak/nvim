-- Custom methods for LSP --
local on_attach = require("configs.mylspconfig").on_attach
local on_init = require("configs.mylspconfig").on_init
local capabilities = require("configs.mylspconfig").capabilities

-- Define servers --
local servers = {
  "lua_ls",
  "basedpyright",
  "bashls",
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers, -- defined above
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Loop through all servers and set up
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({

          on_attach = on_attach,
          on_init = on_init,
          capabilities = capabilities,
        })
      end

      -- Setup lua_ls separately
      lspconfig["lua_ls"].setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = {
                "vim",
                "require",
              },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
  },
}
