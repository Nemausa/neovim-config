local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    file_ignore_patterns = { ".git/", "tags" },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,    
    },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
      },
    },
  },
  extensions = {
    aerial = {
      -- Set the width of the first two columns (the second
      -- is relevant only when show_columns is set to 'both')
      col1_width = 4,
      col2_width = 30,
      -- How to format the symbols
      format_symbol = function(symbol_path, filetype)
        if filetype == "json" or filetype == "yaml" then
          return table.concat(symbol_path, ".")
        else
          return symbol_path[#symbol_path]
        end
      end,
      -- Available modes: symbols, lines, both
      show_columns = "both",
    },
  },
}

vim.api.nvim_create_user_command(
  'Ra',
  function(opts)
    local args = vim.split(opts.args, " ")
    local old_string = args[1]
    local new_string = args[2]
    local match_type = args[3]

    local search_pattern
    if match_type == "exact" then
      search_pattern = '\\V\\<' .. old_string .. '\\>'
    else
      search_pattern = old_string
    end

    vim.cmd('grep! ' .. old_string)
    vim.cmd('copen')
    vim.cmd('cdo s/' .. search_pattern .. '/' .. new_string .. '/g | update')
    vim.cmd('cclose')
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', false)
  end,
  { nargs = '+' }
)

--Telescope
local map = vim.keymap.set
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
-- map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
-- map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
-- map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
-- map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
-- map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
-- map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
local telescope_builtin = require('telescope.builtin')
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Search for: "), search_dirs = { vim.fn.expand("%") } })<CR>')
