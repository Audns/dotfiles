-- ~/.config/nvim/lua/plugins/conform.lua

return {
  "stevearc/conform.nvim", -- The core formatting plugin
  dependencies = { "mason.nvim" }, -- conform needs mason to install formatters

  opts = {
    -- Options for conform.nvim itself
    -- These are merged with LazyVim's defaults.
    -- See `:help conform.setupOpts` for all available options.

    -- --- Default format options ---
    -- These apply to all formatters unless overridden per-formatter or per-filetype.
    default_format_opts = {
      timeout_ms = 3000, -- Max time a formatter is allowed to run
      async = false, -- Generally keep this false in default_format_opts
      quiet = false, -- Set to true to suppress messages
      lsp_format = "fallback", -- Use LSP formatting if no external formatter found
    },

    -- --- Formatters by Filetype ---
    -- This is where you specify which formatter(s) to use for each filetype.
    -- Conform will try them in the order listed.
    formatters_by_ft = {
      -- Example: Lua files use Stylua
      lua = { "stylua" },
      -- Example: Python files use Black
      python = { "black" },
      -- Example: JavaScript/TypeScript/JSON/CSS/HTML use Prettier
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      -- Example: Go files use gofmt
      go = { "gofmt" },
      -- Example: Rust files use rustfmt
      rust = { "rustfmt" },
      -- Example: Shell scripts use shfmt
      sh = { "shfmt" },
      -- Example: Dockerfiles (requires Dockerfile-specific formatter like "dockerfile_lint" if available via Mason)
      -- dockerfile = { "dockerfile_lint" },

      -- To disable formatting for a filetype:
      -- ["*"] = { "injected" }, -- default, enables injected formatters
      -- markdown = {}, -- Empty table disables formatting for markdown
    },

    -- --- Custom Formatters or Overrides ---
    -- This table allows you to define custom formatters or override options for
    -- existing ones (e.g., adding arguments to a formatter).
    -- See `:help conform-formatters` for full details.
    formatters = {
      -- Example: Adding specific arguments to shfmt
      shfmt = {
        prepend_args = { "-i", "2", "-ci" }, -- 2-space indent, preserve comments
      },
      -- Example: Using a formatter only if a specific config file exists
      -- biome = {
      --   condition = function(ctx)
      --     return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.filename, upward = true })[1] ~= nil
      --   end,
      -- },
    },
  },
  keys = {
    -- <leader>fm - format current buffer
    {
      "<leader>fm",
      function()
        require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
      end,
      mode = { "n", "v" },
      desc = "Format current buffer (conform)",
    },
    -- <leader>fF - format current buffer (force all formatters, ignore default_format_opts)
    {
      "<leader>fF",
      function()
        require("conform").format({ bufnr = vim.api.nvim_get_current_buf(), async = false, lsp_format = "never" })
      end,
      mode = { "n", "v" },
      desc = "Force format current buffer (conform)",
    },
  },
  -- The `config` function is run after `opts` are merged.
  -- You generally don't need to call `require("conform").setup(opts)` here
  -- as LazyVim does this for you automatically when merging specs.
  -- Use this section for additional setup, like custom commands or keymaps if needed.
}
