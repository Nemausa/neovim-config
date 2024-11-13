require("symbols-outline").setup({
  providers = {
    "coc"  -- 强制使用 coc 提供的符号
  },
  position = "left",  -- 符号大纲显示位置
  width = 25,         -- 大纲的宽度
  autofold_depth = 2, -- 自动折叠深度
})