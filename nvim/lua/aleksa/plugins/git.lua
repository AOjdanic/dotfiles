return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
    config = function()
      require("gitsigns").setup({
        on_attach = function()
          local gs = require("gitsigns")

          vim.keymap.set("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end)
          vim.keymap.set("n", "<leader>gt", gs.toggle_current_line_blame)
          vim.keymap.set("n", "<leader>gf", gs.diffthis)
          vim.keymap.set("n", "<leader>gF", function()
            gs.diffthis("~")
          end)
        end,
      })
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>L", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>l", "<cmd>LazyGitFilter<cr>", desc = "LazyGit" },
      { "<leader>lf", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit" },
    },
  },
  "tpope/vim-fugitive",
  {
    "NeogitOrg/neogit",
    cmd = {
      "Neogit",
    },
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    keys = {

      { "<leader>G", "<cmd>Neogit<CR>", desc = "Open Neogit" },
    },
  },
}
