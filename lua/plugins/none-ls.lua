return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {

        -- Lua linter + formatter --
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.selene.with({
        --   diagnostic_config = { underline = true, virtual_text = false, signs = true },
        -- }),

        -- Python linter + formatter --
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.pylint.with({
          diagnostic_config = { underline = true, virtual_text = true, signs = true },
        }),
        -- null_ls.builtins.formatting
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Autoformat buffer through null_ls" })
  end,
}
