if vim.fn.has('nvim-0.8') == 1 then
  vim.g.do_filetype_lua=1
  vim.g.did_load_filetypes=0
end

--vim.opt.fileencoding = 'utf-8'
vim.g.mapleader = ' '
vim.opt.expandtab=true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guifont = 'Consolas:h14'
vim.opt.colorcolumn = '80'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.g.ale_enabled = 0
vim.opt.termguicolors = true
vim.opt.lazyredraw = true
vim.g.python3_host_prog = find_python
-- vim.opt.hidden = true
-- vim.o.shada = "'100,<100,s10,h"
-- vim.opt.list = true
-- vim.opt.listchars:append("space:·")
-- vim.cmd [[highlight ExtraWhitespace guibg=lightgrey]]
vim.o.fixendofline = false
vim.o.clipboard = 'unnamedplus'
-- vim.o.shell = 'pwsh'
vim.o.termguicolors = true -- 启用 24 位颜色
vim.g.tagbar_width = 30  -- 设置侧边栏宽度
vim.g.tagbar_position = 'left'  -- 设置侧边栏在左侧显示

-- vim.g.tagbar_width = 30           -- 设置宽度为 30 列
vim.g.tagbar_autofocus = 1        -- 自动聚焦 tagbar 窗口
-- vim.g.tagbar_position = 'right'   -- 将 tagbar 窗口显示在右侧

vim.cmd [[
  let g:gutentags_ctags_exclude = ['.git', 'node_modules', 'build']
]]
