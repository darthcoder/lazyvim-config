return {
  {
    "IndianBoy42/tree-sitter-just",
  },

  {
    "mfussenegger/nvim-dap-python",
    -- stylua: ignore
    config = function()
      local dap_python = require("dap-python")
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      -- dap_python.setup(path .. "/venv/bin/python")
      dap_python.setup("./.venv/bin/python")
      dap_python.test_runner = "pytest"
      table.insert(require('dap').configurations.python, {
        type = "python",
        request = "launch",
        name = "pytest tests/unit",
        python = "./.venv/bin/python",
        module = "pytest",
        args = { "tests/unit" },
        -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      })
    end,
  },

  { "NoahTheDuke/vim-just" },
  { "folke/neoconf.nvim" },

  -- {
  --   "julienvincent/hunk.nvim",
  --   cmd = { "DiffEditor" },
  --   config = function()
  --     require("hunk").setup()
  --   end,
  -- },

  { "rafikdraoui/jj-diffconflicts" },
  { "avm99963/vim-jjdescription" },
  {
    "willothy/flatten.nvim",
    config = true,
    -- or pass configuration with
    -- opts = {  }
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },

  -- { "mistweaverco/kulala.nvim", opts = {} },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {
          mason = false,
        },
      },
    },
  },
}
