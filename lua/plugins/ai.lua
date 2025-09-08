return {
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
