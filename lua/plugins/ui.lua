return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavor = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
    },
  },

  { "NLKNguyen/papercolor-theme" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "PaperColor",
      -- colorscheme = "desert",
      -- colorscheme = "tokyonight-storm",
    },
  },

  -- TODO: LazyExtras
  -- {
  --   "nvim-mini/mini.diff",
  --   config = function()
  --     local diff = require("mini.diff")
  --     diff.setup({
  --       -- Disabled by default
  --       source = diff.gen_source.none(),
  --     })
  --   end,
  -- },
}
