local disable_treesitter_for_large_files = function(bufnr)
    local max_filesize = 100 * 1024 -- 100 KB
    local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(bufnr))
    if stats and stats.size > max_filesize then
        return true
    else
        return false
    end
end

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "python", "cmake", "markdown", "markdown_inline", "lua"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, bufnr)
            return disable_treesitter_for_large_files(bufnr)
        end,
    },
}
require 'nvim-treesitter.install'.compilers = { "clang" }
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   callback = function()
--     disable_treesitter_for_large_files(vim.api.nvim_get_current_buf())
--   end,
-- })
