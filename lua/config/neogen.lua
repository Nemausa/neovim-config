require("neogen").setup {
  enabled = true,
  snippet_engine = "luasnip", -- 使用 luasnip 作为代码片段引擎
  languages = {
      cpp = {
          template = {
              annotation_convention = "doxygen" -- 使用 Doxygen 风格注释
          }
      },
      lua = {
          template = {
              annotation_convention = "emmylua" -- 对 Lua 使用 Emmylua 风格注释
          }
      }
  }
}