return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      max_width = 160,
      max_height = 60,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  keys = {
    {
      "<leader>O",
      "<cmd>Oil --float<CR>",
      desc = "Oil",
    },
  },
}
