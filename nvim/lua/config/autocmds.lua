-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
return {
  "lervag/vimtex",
  ft = { "tex", "latex" },
  config = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura" -- Adjust as needed
    vim.g.tex_indent_enabled = 1 -- Keep general LaTeX indentation

    -- Autocommand to disable indentation in pycode environment
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.tex",
      callback = function()
        -- Check if cursor is inside \begin{pycode}...\end{pycode}
        vim.api.nvim_create_autocmd("InsertEnter", {
          pattern = "*.tex",
          callback = function()
            local line = vim.api.nvim_get_current_line()
            local lnum = vim.api.nvim_win_get_cursor(0)[1]
            local prev_lines = vim.api.nvim_buf_get_lines(0, 0, lnum, false)
            local in_pycode = false

            -- Simple check for \begin{pycode} and \end{pycode}
            for _, pline in ipairs(prev_lines) do
              if pline:match("\\begin{pycode}") then
                in_pycode = true
              elseif pline:match("\\end{pycode}") then
                in_pycode = false
              end
            end

            if in_pycode then
              vim.bo.autoindent = false
              vim.bo.cindent = false
              vim.bo.smartindent = false
              vim.bo.indentexpr = ""
            else
              vim.bo.autoindent = true
              vim.bo.smartindent = true
              vim.bo.indentexpr = "GetTeXIndent()" -- Restore vimtex indent
            end
          end,
        })
      end,
    })
  end,
}
