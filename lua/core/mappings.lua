local map = vim.keymap.set
map('n', '<F1>', '<nop>', { noremap = true, silent = true })
map('i', '<F1>', '<nop>', { noremap = true, silent = true })
map('v', '<F1>', '<nop>', { noremap = true, silent = true })

map('i', 'jj', '<Esc>')
map('i', 'kk', '<Esc>')
map('n', '<leader>ca', 'gg"+yG')
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map('n', '<leader>r', ':!cd bin && ./main <CR>', { noremap = true, silent = true })
map('n', '<leader>b', ':!cd build && cmake .. && make -j<CR>', { noremap = true, silent = true })
map('n', '<C-o>', '<C-o>zz', { noremap = true, silent = true })
map('n', '<leader>w', '<C-w><C-w>', { noremap = true, silent = true })

-- map('n', '<leader>r', ':TermExec cmd="cd bin && ./main"<CR>', { noremap = true, silent = true })
-- map('n', '<leader>b', ':TermExec cmd="cd build && cmake .. && make -j"<CR>', { noremap = true, silent = true })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })
map('n', '<leader>cf', ':!clang-format -i %<CR><CR>', { noremap = true, silent = true })

-- Gitsigns
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
map("n", "<leader>gcl", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Markdown
map("n", "<leader>mp", ":MarkdownPreview<CR>", {})

-- Move
map('x', '<A-Up>', ":move '<-2<CR>gv=gv")
map('n', '<A-Up>', ":move .-2<CR>==")
map('x', '<A-Down>', ":move '>+1<CR>gv=gv")
map('n', '<A-Down>', ":move .+1<CR>==")

-- Debug
map('n', '<F2>', '<cmd>lua require("dapui").toggle()<CR>')
map('n', '<F5>', '<cmd>lua require("dap").continue()<CR>')
map('n', '<F10>', '<cmd>lua require("dap").step_over()<CR>')
map('n', '<F11>', '<cmd>lua require("dap").step_into()<CR>')
map('n', '<F12>', '<cmd>lua require("dap").step_out()<CR>')
map('n', '<F9>', '<cmd>lua require("dap").toggle_breakpoint()<CR>')
map('n', '<leader>B', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
map('n', '<leader>dr', '<cmd>lua require("dap").repl.open()<CR>')
map('n', '<leader>dl', '<cmd>lua require("dap").run_last()<CR>')

-- Lsp
map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true, silent = true })
map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true, noremap = true, silent = true })
map('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "<CR>"', { expr = true, noremap = true, silent = true })
map('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', { expr = true, noremap = true, silent = true })
map('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', { expr = true, noremap = true, silent = true })
map('n', '<leader>ts', ':tselect<CR>t')
map('n', 'gt', ':CocAction<CR>', { noremap = true, silent = true })
map('n', 'gd', '<C-]>', {noremap = true, silent = true })
function TryTagOrCocJump()
  local tag_jump_success = pcall(function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-]>', true, false, true), 'n', true)
  end)

  if not tag_jump_success or vim.fn.getcmdtype() ~= '' then
    local coc_jump_result = vim.fn['CocAction']('jumpDefinition')
    if coc_jump_result == '' then
      print('No definition found with Coc')
    end
  end
end

vim.api.nvim_create_user_command('Ctags', function()
  local cwd = vim.fn.getcwd()
  local result = vim.fn.system('ctags -R --exclude=output  --exclude=linux-5.10 --languages=C,C++ --fields=+l+K --extra=+q --c-kinds=+p+f+g+u+s+e+m+t+v  ' .. cwd)
end, {})
map('n', '<leader>ct', ':Ctags<CR>')

-- new terminal
-- map("n", "<leader>v", ':vsplit | term<CR>', { desc = "terminal new horizontal term" })
-- map("n", "<leader>h", ':split | term<CR>', { desc = "terminal new horizontal term" })
map('t', '<leader>tq', [[<C-\><C-n>:q<CR>]])
map('n', '<leader>to', ':belowright new | resize 40 | terminal<CR>i', { noremap = true, silent = true })


-- switch header or source file
map('x', '<A-o>', ":A<CR>")
map('n', '<A-o>', ":A<CR>")
map('n', '<leader>z', ':A<CR>')

-- switch tab
map('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = "buffer goto next",  noremap = true, silent = true })
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = "buffer goto prev",  noremap = true, silent = true })
map('n', '<leader>bn', ':bnext | bd#<CR>', { desc = "close current tab and buffer goto next",  noremap = true, silent = true })
map('n', '<leader>ba', ':bufdo bd <CR>', { desc = "close all buffers",  noremap = true, silent = true })
local opts = { noremap = true, silent = true }
for i = 1, 9 do
  map('n', '<A-' .. i .. '>', ':tabn ' .. i .. '<CR>', opts)
end

map('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
map('n', '<leader>tt', ':TagbarToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_del_keymap('n', '<Space>ihn')
vim.api.nvim_del_keymap('n', '<Space>is')
vim.api.nvim_del_keymap('n', '<Space>ih')
vim.api.nvim_del_keymap('i', '<Space>ihn')
vim.api.nvim_del_keymap('i', '<Space>is')
vim.api.nvim_del_keymap('i', '<Space>ih')