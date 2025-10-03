return {
  {
    "mg979/vim-visual-multi",
    branch = "master", -- Or 'main' or the specific branch you prefer
    init = function()
      -- Optional: Set global options for vim-visual-multi if desired
      -- vim.g.VM_leader = {'<C-v>'} -- Use Ctrl-v for vertical selection (default is fine)
      -- vim.g.VM_maps = {} -- Customize mappings if needed
    end,
    keys = {
      -- Visual Multi's default mappings are often good, but here are some common ones
      -- that mimic VS Code/Sublime Text more closely:

      -- Add next match (like Ctrl+D in VS Code/Sublime)
      { "<A-d>", "<Plug>(VM-Find-next)", mode = { "n", "x" }, desc = "VM: Add Next Match" },
      -- Add previous match
      { "<C-g>", "<Plug>(VM-Find-prev)", mode = { "n", "x" }, desc = "VM: Add Prev Match" },
      -- Add all matches
      { "<C-S-d>", "<Plug>(VM-Select-All)", mode = { "n", "x" }, desc = "VM: Add All Matches" },

      -- Add cursor above/below (like Alt+Click + dragging)
      { "<A-k>", "<Plug>(VM-Add-Cursor-vert-u)", mode = { "n", "x" }, desc = "VM: Add Cursor Up" },
      { "<A-j>", "<Plug>(VM-Add-Cursor-vert-d)", mode = { "n", "x" }, desc = "VM: Add Cursor Down" },

      -- Split into lines (for a visual selection)
      { "<C-s>", "<Plug>(VM-Split-multi)", mode = "x", desc = "VM: Split Selection" },

      -- Remove last cursor
      { "<C-x>", "<Plug>(VM-Remove-last-cursor)", mode = { "n", "x" }, desc = "VM: Remove Last Cursor" },

      -- Exit visual multi mode
      { "<Esc>", "<Plug>(VM-Escape)", mode = "x", desc = "VM: Escape Multi-cursor" },
      -- Alternative exit for insert mode
      -- {'<Esc>', '<Plug>(VM-Escape)', mode = 'i', desc = 'VM: Escape Multi-cursor'}, -- Be careful, might clash with other plugins
    },
    config = function()
      -- You can place additional configuration here if needed
      -- For example, setting specific highlight groups or behavior
    end,
  },
}
