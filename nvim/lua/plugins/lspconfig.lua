return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { noremap = true, silent = true, buffer = event.buf }

          vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
          vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
          vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts)
          vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
          vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover)

          vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.keymap.set("n", "<leader>[h", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end)
          end
        end,
      })

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local project_name = vim.fn.fnamemodify(vim.loop.cwd(), ":t")
      print(project_name)

      local flatConfig = false
      if project_name == "matpower" then
        flatConfig = true
      end

      local servers = {
        clangd = {},
        lua_ls = {},
        cssls = {},
        rust_analyzer = {},
        gopls = {},
        tailwindcss = {},
        -- emmet_language_server = {},
        jsonls = {},
        ts_ls = {},
        vuels = {
          settings = {
            vetur = {
              completion = {
                autoImport = true,
              },
              languageFeatures = {
                updateImportOnFileMove = true,
              },
            },
          },
        },
        volar = {},
        bashls = {},
        eslint_d = {},
        eslint = {
          settings = {
            useFlatConfig = flatConfig,
            autoFixOnSave = true,
          },
        },
      }

      local mason = require("mason")
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      local ensure_installed = vim.tbl_keys(servers or {})

      vim.list_extend(ensure_installed, {
        "prettier",
        "prettierd",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
        "shfmt",
        "luacheck",
        "alex",
        "hadolint",
        "shellcheck",
        "vimls",
        -- "gofumpt",
        -- "golangci-lint",
      })

      local mason_tool_installer = require("mason-tool-installer")
      mason_tool_installer.setup({ ensure_installed = ensure_installed })

      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mason_lspconfig.setup({
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}

            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            lspconfig[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
