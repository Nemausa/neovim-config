require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 1  -- 调整高度
    else
      return 20
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,       -- 隐藏行号
  shade_terminals = false,   -- 禁用终端着色，提高性能
  start_in_insert = true,
  direction = "horizontal",
  close_on_exit = true,
})