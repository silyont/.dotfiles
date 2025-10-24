---@type LazySpec
return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you prefer nvim-web-devicons
  config = function() require("render-markdown").setup {} end,
}
