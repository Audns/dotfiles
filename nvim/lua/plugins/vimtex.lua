return {
  {
    "lervag/vimtex",
    lazy = false, -- Load immediately for LaTeX files
    ft = { "tex", "latex" }, -- Load only for .tex files
    init = function()
      -- vimtex settings
      vim.g.tex_flavour = "latex"
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_general_viewer = "evince"
      vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-xelatex",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },
}
