local function disable_treesitter_for_large_files(bufnr)
  local max_filesize = 100 * 1024 -- 100 KB
  local file = vim.api.nvim_buf_get_name(bufnr)
  local ok, stats = pcall(vim.loop.fs_stat, file)

  if ok and stats and stats.size < max_filesize then
    vim.api.nvim_buf_set_option(bufnr, 'syntax', 'on')
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "cpp", "python", "cmake", "markdown" },
      highlight = {
        enable = true,
        disable = function(_, buf)
          local buf_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
          return buf_size > max_filesize
        end,
      },
    }
  else
    vim.api.nvim_buf_set_option(bufnr, 'syntax', 'off')
  end
end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    disable_treesitter_for_large_files(vim.api.nvim_get_current_buf())
  end,
})