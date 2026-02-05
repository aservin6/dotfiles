return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({ transparent = { bg = true } })
      vim.cmd.colorscheme("nordic")
    end,
  },
}
