local function find_first_existing_dir(paths)
  for _, path in ipairs(paths) do
    if vim.fn.isdirectory(path) == 1 then
      return path
    end
  end
  return nil -- No existing directory found
end

return {
  {
    "factor/factor.nvim",
    ft = "factor",
    config = function()
      local is_windows = (vim.loop.os_uname().sysname == "Windows")

      require("factor").setup({
        -- Path to your Factor installation (default: ~/factor/)
        resource_path = find_first_existing_dir({
          vim.fn.expand("~/Documents/GitHub/factor"),
          vim.fn.expand("~/factor/"),
          "/Applications/Factor.app",
        }),

        -- Default vocabulary roots
        default_vocab_roots = {
          "resource:core",
          "resource:basis",
          "resource:extra",
          "resource:work",
        },

        -- Additional vocabulary roots (can also be set in ~/.factor-roots)
        -- additional_vocab_roots = nil,

        -- Function to determine the root for new vocabularies
        new_vocab_root = function()
          return find_first_existing_dir({
            vim.fn.expand("~/Documents/factor"),
            vim.fn.expand("~/p/2025/factor"),
          }) or "resource:work"
        end,

        -- Enable smart auto-pairing of brackets, quotes, etc.
        enable_autopairs = false,

        -- Characters to escape in glob patterns
        glob_escape = is_windows and "*[]?`{$" or "*[]?`{$\\",
      })
    end,
  },
}
