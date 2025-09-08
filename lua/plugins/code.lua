return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.just = {
        install_info = {
          url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
          -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
        },
        maintainers = { "@IndianBoy42" },
        filetype = "just",
      }
    end,
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

  {
    "olimorris/codecompanion.nvim",
    opts = {
      -- TODO: adapters and API keys
      adapters = {
        -- acp = {
        --   claude_code = function()
        --     return require("codecompanion.adapters").extend("claude_code", {
        --       env = {
        --         api_key = "cmd:op read op://path/to/claude_code/api/key --no-newline",
        --       },
        --     })
        --   end,
        -- },
        -- http = {
        --   -- TODO: configure FuelIX here
        -- },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      -- TODO: strategies
      strategies = {
        chat = {
          adapter = "anthropic",
          model = "claude-sonnet-4-20250514",
        },
        inline = {
          adapter = "anthropic",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    },
  },
}
