-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
  {
    "akinsho/toggleterm.nvim",
    -- This ensures your configuration applies to the already-defined toggleterm plugin
    -- in LazyVim's core configuration.

    -- Define your options here. LazyVim will merge these with its default options.
    opts = {
      -- Basic settings
      size = 20, -- Default height for horizontal terminals
      -- REMOVE or keep commented: open_mapping = [[<leader>t]],
      -- This 'open_mapping' option tells toggleterm which mapping it *prefers* internally
      -- but doesn't necessarily create the Neovim keymap. We'll use the 'keys' table for that.
      direction = "horizontal", -- Default direction for the main toggle
      shade_terminals = true, -- Shade the terminal windows
      persist_size = true, -- Remember the size of the terminal
      persist_mode = true, -- Remember the mode of the terminal (e.g., normal vs. insert)

      -- Floating terminal specific settings
      float_config = {
        border = "curved", -- or "single", "double", "none"
        width = 0.9, -- Width as a percentage of editor width
        height = 0.9, -- Height as a percentage of editor height
        winblend = 3, -- How much the floating window blends with the background (0-100)
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      cwd = function()
        -- Get the directory of the current buffer, or fallback to Neovim's CWD
        local current_file_dir = vim.fn.expand("%:p:h")
        if vim.fn.filereadable(vim.fn.expand("%")) then
          return current_file_dir
        else
          return vim.fn.getcwd()
        end
      end,
      -- ...
      -- Other specific configurations
      -- shell = vim.o.shell, -- Use your default shell (e.g., bash, zsh, powershell)
      -- close_on_exit = true, -- Close terminal buffer when its process exits
      -- start_in_insert = true, -- Start in insert mode

      -- Add any other toggleterm options you want to customize here.
    },
    -- *** IMPORTANT: Define keymaps here using the 'keys' table for lazy.nvim ***
    keys = {
      -- Horizontal Terminal (Your desired <leader>t mapping)
      {
        "<leader>t",
        "<cmd>ToggleTerm<CR>",
        mode = { "n", "t" }, -- n: normal mode, t: terminal mode (to exit)
        desc = "Toggle horizontal terminal",
      },
      -- Floating Terminal (Your <leader>T mapping - often default in LazyVim, but explicit is good)
      {
        "<leader>T",
        "<cmd>ToggleTerm direction=float<CR>",
        mode = { "n", "t" },
        desc = "Toggle floating terminal",
      },
      -- Vertical Terminal (Optional, if you want a dedicated vertical one)
      {
        "<leader>tv",
        "<cmd>ToggleTerm direction=vertical<CR>",
        mode = { "n", "t" },
        desc = "Toggle vertical terminal",
      },
      {
        "<leader>td", -- Short for "terminal directory" or "terminal here"
        "<cmd>ToggleTerm dir=%:p:h<CR>",
        mode = { "n", "t" },
        desc = "Toggle terminal in current file's directory",
      },
      -- Example for specific numbered terminals (as per original question)
      {
        "1<leader>t",
        function()
          require("toggleterm").toggle(1)
        end,
        mode = { "n", "t" },
        desc = "Toggle terminal 1",
      },
      {
        "2<leader>t",
        function()
          require("toggleterm").toggle(2)
        end,
        mode = { "n", "t" },
        desc = "Toggle terminal 2",
      },
    },
    -- The 'config' function runs *after* 'opts' are merged and setup is called.
    -- This is a good place for setting up additional keymaps or special logic.
    config = function(_, opts)
      -- This ensures toggleterm.setup is called with your merged options.
      require("toggleterm").setup(opts)

      -- You can still add custom keymaps here with vim.keymap.set if preferred for some reason,
      -- but the 'keys' table in the plugin spec is generally cleaner for plugin-specific maps.
      -- For example, if you wanted a very specific custom command not tied to general toggling:
      -- vim.keymap.set("n", "<leader>tc", function() require("toggleterm").toggle_new({cmd = "ls", dir = "~"}) end, { desc = "Run ls in new terminal" })
    end,
  },
}
