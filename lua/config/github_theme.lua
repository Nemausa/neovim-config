require('github-theme').setup({
  -- Options
  options = {
    comment_style = { italic = true },
    keyword_style = { bold = true },
    function_style = { bold = true },
    variable_style = { italic = true },
    dark_float = true,  -- Dark background for floating windows
    dark_sidebar = true,  -- Dark background for sidebars like NERDTree
    transparent = false,  -- Enable transparency in the background
    hide_inactive_statusline = false,  -- Hide inactive statuslines
    -- Change terminal colors as per the theme
    colors = { hint = "orange", error = "#ff0000" },  -- Override specific colors
    overrides = function(c)
        return {
            -- Example to customize specific highlight groups
            CursorLine = { bg = c.bg_highlight, underline = true },
            -- Custom group
            MyGroup = { fg = c.orange, bg = c.bg_statusline, bold = true },
        }
    end,
  }
})

-- Apply the theme by setting a colorscheme
vim.cmd('colorscheme github_dark')
