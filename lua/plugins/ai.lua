return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      adapters = {
        acp = {
          claude_code = function()
            return require("codecompanion.adapters").extend("claude_code", {
              env = {
                ANTHROPIC_BASE_URL = "https://api.fuelix.ai",
                ANTHROPIC_AUTH_TOKEN = "cmd:op --account my.1password.com read 'op://Private/tsadcgixxpof4yapxdrue2nzzi/credential' --no-newline",
                ANTHROPIC_MODEL = "claude-sonnet-4",
              },
            })
          end,
        },
        http = {
          fuelix = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              url = "https://api.fuelix.ai/v1/chat/completions",
              env = {
                url = "https://api.fuelix.ai",
                api_key = "cmd:op --account my.1password.com read 'op://Private/tsadcgixxpof4yapxdrue2nzzi/credential' --no-newline",
              },
            })
          end,
        },
      },
      -- extensions = {
      -- mcphub = {
      --   callback = "mcphub.extensions.codecompanion",
      --   opts = {
      --     make_vars = true,
      --     make_slash_commands = true,
      --     show_result_in_chat = true,
      --   },
      -- },
      -- },
      opts = {
        -- log_level = "TRACE",
      },
      strategies = {
        chat = {
          -- adapter = "claude_code",
          adapter = "fuelix",
          model = "claude-sonnet-4",
        },
        inline = {
          adapter = "fuelix",
          model = "gemini-2.5-pro",
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
