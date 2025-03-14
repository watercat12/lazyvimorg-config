--- Get global file path by type
---@param ext string
---@return string
local function get_global_file_by_type(ext)
  local state_path = vim.fn.stdpath("state")
  local path = state_path .. "/code-runner"
  -- Create code-runner folder if it does not exist
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path)
  end

  return string.format("%s/code-pad.%s", path, ext)
end

return {
  {
    "jellydn/quick-code-runner.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = { "QuickCodeRunner", "QuickCodePad" },
    keys = {
      {
        "<leader>cr",
        ":QuickCodeRunner<CR>",
        desc = "Quick Code Runner",
        mode = "v",
      },
      {
        "<leader>cn",
        ":QuickCodePad<CR>",
        desc = "Quick Code Pad",
      },
    },
    opts = {
      file_types = {
        javascript = { "bun run" }, -- Run command for javascript, you can change to `node` or `deno`
        typescript = { "bun run" }, -- Run command for typescript, you can change to `npx tsx run` or `deno`
        python = {
          "python3 -u", -- Run command for python
        },
        go = {
          "go run",
        },
        sh = {
          "bash",
        },
        txt = {
          "bash",
        },
        markdown = {
          "bash",
        },
      },
      global_files = {
        javascript = get_global_file_by_type("js"),
        typescript = get_global_file_by_type("ts"),
        python = get_global_file_by_type("py"),
        go = get_global_file_by_type("go"),
        lua = get_global_file_by_type("lua"),
        sh = get_global_file_by_type("sh"),
        txt = get_global_file_by_type("sh"),
        markdown = get_global_file_by_type("sh"),
      },
      -- Center the code pad
      position = "50%",
      -- Default size of the code pad
      size = {
        width = "80%",
        height = "80%",
      },
    },
  },
}
