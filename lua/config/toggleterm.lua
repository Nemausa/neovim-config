require("toggleterm").setup({
  -- size = function(term)
  --   if term.direction == "horizontal" then
  --     return vim.o.lines * 0.8  -- 调整高度
  --   else
  --     return vim.o.lines * 0.8  -- 调整高度
  --   end
  -- end,
  -- size = vim.o.lines * 0.8;
  size = 40,
  open_mapping = [[<c-\>]],
  hide_numbers = true,       -- 隐藏行号
  shade_terminals = false,   -- 禁用终端着色，提高性能
  start_in_insert = true,
  shading_factor = 2,
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "curved"
  }
})
