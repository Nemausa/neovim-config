require'colorizer'.setup({
  '*'; -- 启用所有文件类型
}, {
  RGB = true;      -- 支持 #RGB 格式
  RRGGBB = true;   -- 支持 #RRGGBB 格式
  names = true;    -- 支持颜色名称（如 `Red`）
  RRGGBBAA = true; -- 支持 #RRGGBBAA 格式
  rgb_fn = true;   -- 支持 CSS 函数 rgb(), rgba()
  hsl_fn = true;   -- 支持 CSS 函数 hsl(), hsla()
  css = true;      -- 支持 CSS 的颜色属性
  css_fn = true;   -- 支持 CSS 函数的颜色属性
})