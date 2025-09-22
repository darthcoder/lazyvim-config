return {
  -- I'm not sure this is the right place for this plugin's config...
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "will133/vim-dirdiff" },
  {
    "julienvincent/hunk.nvim",
    cmd = { "DiffEditor" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-mini/mini.icons",
    },
    config = function()
      require("hunk").setup()
    end,
  },
  { "whiteinge/diffconflicts" },
}
