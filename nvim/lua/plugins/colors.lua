return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    event = "VeryLazy",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    config = function()
      -- vim.cmd("colorscheme rose-pine-moon")
    end,
  },
}
