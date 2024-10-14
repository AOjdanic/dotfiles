local config = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "html",
      "lua",
      "markdown",
      "vim",
      "vimdoc",
      "css",
      "cpp",
      "go",
      "lua",
      "python",
      "rust",
      "tsx",
      "javascript",
      "typescript",
      "bash",
      "vue",
      "json",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })

  require("nvim-ts-autotag").setup()
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = config,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
  },

  { "nvim-treesitter/nvim-treesitter-context", event = { "BufReadPre", "BufNewFile" } },
}
