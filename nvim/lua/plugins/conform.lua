return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofumpt" },
        rust = { "rustfmt" },
        c = { "clang_format" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
      format_after_save = {
        lsp_format = "fallback",
      },
    })
  end,
}
