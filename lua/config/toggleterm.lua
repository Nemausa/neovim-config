require('toggleterm').setup({
    size = 10, -- 设置终端窗口的高度
    open_mapping = [[<c-\>]], -- 设置快捷键打开/关闭终端
    shade_terminals = true, -- 为终端窗口添加阴影效果
    direction = 'horizontal', -- 终端的方向 ('horizontal' 表示水平，'vertical' 表示垂直)
    close_on_exit = true, -- 终端关闭时自动关闭窗口
    shell = vim.o.shell, -- 使用默认的 shell
    float_opts = {
        border = 'curved', -- 浮动窗口的边框样式（可选值有：'single', 'double', 'shadow', 'curved'）
        width = 100,
        height = 30,
      },
    on_open = function(term)
        vim.cmd("startinsert")
    end,
})