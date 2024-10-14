return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local projectPath = vim.fn.system("pwd")

    local function custom_split(inputstr, sep)
      local t = {}
      for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
      end
      return t
    end

    local list = custom_split(projectPath, "/")
    local str = list[#list]:gsub("%s+", "")

    local jsFormatter
    if str == "kvcore-crm" then
      jsFormatter = "eslint_d"
    else
      jsFormatter = "prettier"
    end

    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { jsFormatter },
        typescript = { "eslint", "prettier" },
        javascriptreact = { "eslint", "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { jsFormatter },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        sh = { "shfmt" },
        go = { "gofumpt" },
        vue = { "eslint_d" },
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

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
