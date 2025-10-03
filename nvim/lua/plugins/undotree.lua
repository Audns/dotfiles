return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>U", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2 -- Optional: Customize layout
      vim.g.undotree_DiffpanelHeight = 10 -- Optional: Set diff panel height
      vim.g.undotree_SetFocusWhenToggle = 1 -- Optional: Focus on undotree when toggled
    end,
  },
}
