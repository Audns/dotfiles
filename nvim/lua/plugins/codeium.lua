return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      require("neocodeium").setup()
      vim.keymap.set("i", "<C-f>", function()
        require("neocodeium").accept()
      end)
      vim.keymap.set("i", "<C-]>", function()
        require("neocodeium").cycle()
      end)
      vim.keymap.set("i", "<C-[>", function()
        require("neocodeium").cycle(-1)
      end)
    end,
  },
}
