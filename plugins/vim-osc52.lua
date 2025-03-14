return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("v", "<leader>y", require("osc52").copy_visual, { desc = "Yank selection to clipboard" })
    vim.keymap.set("n", "<leader>cp", function()
      local path = vim.fn.expand("%:p") -- Get the absolute file path
      -- local line = vim.fn.getline(".")
      -- local path = vim.fn.fnamemodify(line, ":p")
      require("osc52").copy(path) -- Copy the path using OSC 52
      print("Copied path: " .. path) -- Optional feedback
    end, { desc = "Copy file path (OSC 52)" })
  end,
}
