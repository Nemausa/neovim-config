if vim.fn.has('nvim-0.8') == 1 then
  vim.g.do_filetype_lua=1
  vim.g.did_load_filetypes=0
end

--vim.opt.fileencoding = 'utf-8'
vim.g.mapleader = ','
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
-- vim.opt.list = true
-- vim.opt.listchars:append("space:·")
-- vim.cmd [[highlight ExtraWhitespace guibg=lightgrey]]
vim.o.fixendofline = false
vim.o.clipboard = 'unnamedplus'
-- vim.o.shell = 'pwsh'
vim.o.termguicolors = true -- 启用 24 位颜色

vim.cmd [[
  let g:gutentags_ctags_exclude = ['.git', 'node_modules', 'build']
]]
