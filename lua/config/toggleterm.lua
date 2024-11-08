require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.8  -- 将高度设置为窗口的 30%
    else
      return 20
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  direction = "horizontal",
  close_on_exit = true,
})
