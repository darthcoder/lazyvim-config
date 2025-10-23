return {
  name = "just test current file (just test-file FILENAME)",
  builder = function()
    local filename = vim.fn.expand("%:t:r")
    return {
      cmd = { "just" },
      args = { "test-file", filename },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    callback = function(search)
      local justfile = vim.fn.getcwd() .. "/Justfile"
      local dot_justfile = vim.fn.getcwd() .. "/.justfile"
      return vim.uv.fs_stat(justfile) or vim.uv.fs_stat(dot_justfile)
    end,
  },
}
